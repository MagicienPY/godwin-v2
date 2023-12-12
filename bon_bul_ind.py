from tkinter import *
from reportlab.lib.pagesizes import landscape, letter
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle
from reportlab.lib import colors
import pymysql

class GenerateurBulletin:
    def __init__(self):
        self.root = Tk()
        self.root.title("Générateur de bulletin")
        self.root.geometry("400x200")

        self.matricule_label = Label(self.root, text="Matricule de l'étudiant:")
        self.matricule_label.pack()

        self.matricule_entry = Entry(self.root)
        self.matricule_entry.pack()

        self.rechercher_button = Button(self.root, text="Rechercher", command=self.rechercher_etudiant)
        self.rechercher_button.pack()

        self.nom_etudiant_label = Label(self.root, text="")
        self.nom_etudiant_label.pack()

        self.resultat_label = Label(self.root, text="")
        self.resultat_label.pack()

    def run(self):
        self.root.mainloop()

    def rechercher_etudiant(self):
        # Connexion à la base de données
        conn = pymysql.connect(host='localhost', user='root', password='', db='g_note')
        cursor = conn.cursor()

        # Demande de saisie du matricule de l'étudiant
        mat_etudiant = self.matricule_entry.get()

        # Requête SQL pour récupérer les informations de l'étudiant
        etudiant_query = '''
        SELECT mat_etudiant, nom_etu
        FROM etudiant
        WHERE mat_etudiant = %s
        '''
        # Exécution de la requête pour récupérer les informations de l'étudiant
        cursor.execute(etudiant_query, (mat_etudiant,))
        etudiant = cursor.fetchone()

        if etudiant:
            # Affichage des informations de l'étudiant trouvé
            self.nom_etudiant_label.config(text=f"Nom de l'étudiant : {etudiant[1]}")

            # Génération et impression du bulletin de l'étudiant
            self.generer_bulletin(etudiant[0], etudiant[1])

            self.resultat_label.config(text="Le bulletin a été généré et imprimé avec succès.")
        else:
            self.resultat_label.config(text="Aucun étudiant trouvé avec ce matricule.")

        # Fermeture de la connexion à la base de données
        conn.close()

    def generer_bulletin(self, mat_etudiant, nom_etudiant):
        # Connexion à la base de données
        conn = pymysql.connect(host='localhost', user='root', password='', db='g_note')
        cursor = conn.cursor()

        # Requête SQL pour récupérer les données du bulletin de l'étudiant
        bulletin_query = '''
       SELECT 
            note.semestre, 
            matiere.nom_matiere, 
            matiere.coef_matiere,
            etudiant.mat_etudiant, 
            etudiant.nom_etu, 
            note.type_note, 
            (SUM(note.note_cc * cote.cote_cc * matiere.coef_matiere) + SUM(note.note_sn * cote.cote_sn * matiere.coef_matiere)) / SUM(matiere.coef_matiere) AS moyenne, 
            RANK() OVER (PARTITION BY etudiant.mat_etudiant, note.semestre ORDER BY (SUM(note.note_cc * cote.cote_cc * matiere.coef_matiere) + SUM(note.note_sn * cote.cote_sn * matiere.coef_matiere)) / SUM(matiere.coef_matiere) DESC) AS ordre_merite,
            classe.nom_classe
        FROM 
            cote 
        INNER JOIN 
            note ON cote.id_cote = note.id_cote 
        INNER JOIN 
            matiere ON note.id_matiere = matiere.id_matiere 
        INNER JOIN 
            etudiant ON etudiant.id_etudiant = note.id_etudiant 
        INNER JOIN
            classe ON etudiant.id_classe = classe.id_classe
        WHERE 
            note.type_note IN ("cc", "sn", "examen") 
            AND etudiant.mat_etudiant = %s
        GROUP BY 
            etudiant.mat_etudiant, note.semestre, matiere.nom_matiere, matiere.coef_matiere, classe.nom_classe
        ORDER BY 
            classe.nom_classe, etudiant.mat_etudiant, note.semestre, moyenne DESC
        '''

        # Création du document PDF en format paysage
        doc = SimpleDocTemplate(f"individuel/{mat_etudiant}.pdf", pagesize=landscape(letter))

        # Liste pour contenir les éléments dubulletin
        elements = []

        # Style par défaut pour les paragraphes
        styles = getSampleStyleSheet()

        # Création du paragraphe pour le titre du bulletin
        titre = Paragraph(f"<u>Bulletin de notes de {nom_etudiant}</u>", styles["Title"])
        elements.append(titre)
        elements.append(Spacer(1, 20))

        # Exécution de la requête pour récupérer les données du bulletin de l'étudiant
        cursor.execute(bulletin_query, (mat_etudiant,))

        # Récupération des données du bulletin
        bulletin_data = cursor.fetchall()

        if bulletin_data:
            # Création du tableau pour afficher les données du bulletin
            data = [["Semestre", "Matière", "Coefficient", "Note finale", "Ordre de mérite", "Classe"]]
            for row in bulletin_data:
                data.append(list(row))

            # Création du style pour le tableau
            table_style = TableStyle([
                ("BACKGROUND", (0, 0), (-1, 0), colors.lightblue),
                ("TEXTCOLOR", (0, 0), (-1, 0), colors.whitesmoke),
                ("ALIGN", (0, 0), (-1, -1), "CENTER"),
                ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
                ("FONTSIZE", (0, 0), (-1, 0), 12),
                ("BOTTOMPADDING", (0, 0), (-1, 0), 12),
                ("BACKGROUND", (0, 1), (-1, -1), colors.beige),
                ("GRID", (0, 0), (-1, -1), 1, colors.black)
            ])

            # Création du tableau avec les données du bulletin
            table = Table(data)
            table.setStyle(table_style)

            # Ajout du tableau au document PDF
            elements.append(table)
        else:
            # Message d'erreur si aucune donnée trouvée
            elements.append(Paragraph("Aucune donnée trouvée pour ce matricule.", styles["Normal"]))

        # Génération du document PDF
        doc.build(elements)

        # Fermeture de la connexion à la base de données
        conn.close()

generateur = GenerateurBulletin()
generateur.run()