################################################################################
# R-Einführungsübung (SW1/Serie 1)
################################################################################

# Aufgabe 1 - Visualisierung von Daten und Berechnung von Kenngrössen
# 
#     Das Dataframe d.fuel enthält die Daten verschiedener Fahrzegue aus einer 
#     amerikanischen Untersuchung der 80er-Jahre. Jede Zeile (row) enthält die
#     Daten eines Fahrzeuges (ein Fahrzeug entspricht einer Beobachtung).


# 1a) Daten einlesen
t.file <- "http://stat.ethz.ch/Teaching/Datasets/NDK/d.fuel.dat"
d.fuel <- read.table(t.file,header=T,sep=",")

# 1b) Betrachten der eingelesenen Daten
d.fuel

# 1c) fünften Eintrag auswählen aus d.fuel
d.fuel[5,]

# 1d) erste bis fünfte Beobachtung des Datensatzes
d.fuel[1:5,]

# 1e) zeige 1. bis 3. und 57. bis 60. Beobachtung des Datensatzes
d.fuel[1:3,]; d.fuel[57:60,]
# Frage: Kann man diese Kommandos zusammenfassen?
#        Etwa in der Form 
#        d.fuel[(1:3):(57:60),]

# 1f) Berechne Mittelwert der Reichweiten aller Autos im Miles/Gallon

# 1g) Berechne Mittelwert der Reichweiten der Autos 7 bis 22.

# 1h) Erzeuge neuen Vektor t.kml welcher alle Reichweiten in km/l enthält
#     "                    t.kg  welcher alle Gewichte in kg enthält

# 1i) Berechne Mittelwert der Reichweiten in km/l und denjenigen der Gewichte

# 1j) Zeichne ein Streudiagramm, welches den Verbrauch pro 100km als Funktion
#     des Gewichtes in kg darstellt.

# 1k) Machen Sie eine Stamm-Blatt-Darstellung der Benzinverbräuche pro 100km.
#     Bestimmen Sie den minimalen und maximalen Verbrauch.
#     >>> Hinweis: stem()

