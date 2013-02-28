# Serie 2 - Stochastik

# 1a)
# daten einlesen aus Datei

d.flaeche <- read.table("flaeche")

# summe aller Flächen

sum(d.flaeche)

# quadrat der summe der flächen

sum(d.flaeche^2)

# 1b)


# 5a) Zeichnen Sie Histogramme von der Zeitspanne zwischen zwei Ausbrüchen:

geysir <- read.table("http://stat.ethz.ch/Teaching/Datasets/geysir.dat", header=TRUE)
par(mfrow = c(2,2))
hist(geysir[,"Zeitspanne"])
hist(geysir[,"Zeitspanne"], breaks = 20)
hist(geysir[,"Zeitspanne"], breaks = seq(41, 96, by=11))

# Was fällt auf? Was ist der Unterschied zwischen den Histogrammen?
# >>> je feiner die Auflösung, desto mehr fallen Ausreisser auf
# >>> je grösser die Auflösung, desto mehr Information geht verloren
#     (siehe Diagramm 1 Bereich 50-55 und den gleichen Zeitraum in Diagramm 3)
#     zudem können grosse Auflösungen je nach Grenzen Daten visuell "fälschen"

# 5a) Zeichnen Sie die Histogramme (Anzahl Klassen variieren) von der 
#     Eruptionsdauer

hist(geysir[,"Eruptionsdauer"])

# Was fällt auf? Vergleichen Sie mit der ersten Teilaufgabe.
# >>> 

