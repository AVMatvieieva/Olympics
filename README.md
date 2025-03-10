# Olympische Spiele 1896-2016: Datenanalyse
### Überblick
Dieses Projekt analysiert die Olympischen Spiele von 1896 bis 2016 mithilfe von Datenverarbeitung, Datenbankmanagement und statistischer Analyse. Ziel ist es, interessante Erkenntnisse aus den historischen Olympischen Spielen zu gewinnen
### Projektstruktur

#### 1. Datenverarbeitung und Bereinigung

Datei: Olympische Athleten-Datenanalyse.ipynb

Beschreibung:

Die Rohdaten aus olympics_cleaned_v4.csv werden in separate Dateien unterteilt: events, athletes, athletes_events und countries.

Erstellung eines ERM-Schemas zur besseren Datenstrukturierung.
![ERM-Schemas Olympics](https://github.com/AVMatvieieva/Olympics/blob/main/images/ERM.png)

Datenbereinigung: Entfernung von Duplikaten, Behandlung fehlender Werte und Konvertierung in geeignete Datentypen.

#### 2. Datenbankmanagement (MySQL)

Dateien:

CreateDatabase.sql – Erstellt die Datenbank olympics_data.

LOAD_DATA_INFILE.sql – Lädt die bereinigten Daten in die Datenbanktabellen.

Querries.sql – Enthält verschiedene SQL-Abfragen zur Datenanalyse.

#### 3. Datenanalyse mit Python

Datei: Olympic_Analytic.ipynb

Beschreibung:

Analyse der Daten mit pandas, matplotlib und seaborn.

Untersuchung von Trends, Korrelationen und Mustern in den Olympischen Spielen.

#### 4. Datenvisualisierung mit Tableau

Beschreibung:

Interaktive Visualisierungen wurden mit Tableau erstellt.

[Link zur Tableau Public-Seite: Olympics in Tableau](https://public.tableau.com/app/profile/anna.matvieieva/viz/DetailsofOlympics1896-2016/Olympics)

![Screenshot der Visualisierung ist im Repository enthalten.](https://github.com/AVMatvieieva/Olympics/blob/main/images/Tableau%20screen%201.png)
![](https://github.com/AVMatvieieva/Olympics/blob/main/images/Tableau%20screen%202.png)

#### Fragestellungen und Zielsetzung

Frage 1: Welche Länder haben in den letzten Jahrzehnten in welchen Sportarten dominiert?

Zielsetzung: Analyse der Medaillenverteilung, um die Dominanz einzelner Länder in bestimmten Disziplinen zu erkennen.

Frage 2: Gibt es Korrelationen zwischen Körpergröße/Gewicht und Erfolg in bestimmten Sportarten?

Zielsetzung: Untersuchung, ob physische Attribute in bestimmten Disziplinen eine Rolle spielen (z. B. Leichtathletik vs. Gewichtheben).

Frage 3: In welchen Altersgruppen sind Athleten in unterschiedlichen Disziplinen am erfolgreichsten?

Zielsetzung: Analyse der Altersverteilung bei Medaillengewinnern, um Alterstrends in verschiedenen Sportarten aufzuzeigen.

#### Technologien und Tools

Datenbank: MySQL

Programmiersprachen: Python (pandas, matplotlib, seaborn)

Visualisierung: Tableau

Datenmanagement: SQL

#### Nutzung des Projekts

Datenbank einrichten: Führen Sie CreateDatabase.sql aus und laden Sie die Daten mit LOAD_DATA_INFILE.sql.

SQL-Analysen durchführen: Nutzen Sie die Abfragen aus Querries.sql, um Erkenntnisse zu gewinnen.

Python-Analyse ausführen: Öffnen Sie Olympic_Analytic.ipynb und führen Sie die Analysen durch.

Visualisierungen betrachten: Besuchen Sie die Tableau Public-Seite.

#### Autor

Anna Matvieieva
