# R-Einführungsübung

# Ausgabe 1 - Visualisierung von Daten und Berechnung von Kenngrössen
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

