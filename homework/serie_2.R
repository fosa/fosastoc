# Serie 2 - Stochastik

# 1) Bei der Ermittlung der landwirtschaftlichen Nutzfläche von Bauernhöfen in
#    einem Bezirk ergaben sich folgende Werte (in ha):
#    2.1 2.4 2.8 3.1 4.2 4.9 5.1 6.0 6.4 7.3 10.8 12.5 
#    13.0 13.7 14.8 17.6 19.6 23.0 25.0 35.2 39.6
#
#    >>> und das ganze einfacher zu machen habe ich die daten in eine Datei 
#        abgelegt und lese diese dann ein

d.flaeche <- read.table("flaeche")

# 1b) Berechnen Sie die Summen der Fläche und die Summe der Quadrate davon

sum(d.flaeche)

sum(d.flaeche^2)

# 1b) Bestimmen Sie den Median

median(d.flaeche[,1])

# 1c) Berechnen Sie den Mittelwert und die Standardabweichung

mean(d.flaeche[,1])

sd(d.flaeche[,1]) 

# 2) Gegeben sind die Datenpaare (x,y)
#
#    x  2   2   6   7   7   8   8   9
#    y 11  14  14  16  27  27  27  38

d.paare  <- read.table("datenpaar", sep=",", header=TRUE)

# 2a) Gesucht sind die Summen von x, x^2, y, y^2 und x*y

sum(d.paare[,1])
sum(d.paare[,1]^2)
sum(d.paare[,2])
sum(d.paare[,2]^2)
sum(d.paare[,1] * d.paare[,2])

# 2b) Verifizieren Sie die Gleichheit der Formeln (siehe Aufgabenstellung)

n  <- length(d.paare[,1])
        # habe eine variable n definiert um den Ausdruck zu vereinfachen
x <- d.paare[,1]
y <- d.paare[,2]
        # genauso für die Inhalte der Daten bzw. die Datenpaare
(1/(n-1)) * sum((x-mean(x))^2)

(1/(n-1)) * (sum(x^2) - (n*mean(x)^2))

# 2c) Beweisen Sie die Gleichheit von Teilaufgabe b) allgemein.

# 3) Zeigen Sie, dass (siehe Aufgabenstellung) den kleinsten Wert annimmt,
#    falls die Parameter (siehe Aufgabenstellung) sind

b <- (sum((d.paare[,2] - mean(d.paare[,2])) * (d.paare[,1] - mean(d.paare[,1])) ) / (sum(d.paare[,1] - mean(d.paare[,1]))^2))

a <- (mean(d.paare[,2]) - ( * mean(d.paare[,1])))
        # was ist die "relative Trefferhäufigkeit" für b??? (siehe S.237)

sum(d.paare[,2] - (a + b*d.paare[,1])^2)

# 4) Bei einer Firma werden in einem Monat 400 Lebensversicherungsverträge 
#    abgeschlossen. Nachstehend ist die Häufigkeitsverteilung für 
#    Versicherungssummen.
#
#    Summe (Tausend Fr) von .. bis unter...     Anzahl der Verträge
#                                       4-10            20
#                                       10-20           160
#                                       20-30           80
#                                       30-40           40
#                                       40-80           88
#                                       80-120          12

verssum <- c(10,20,30,40,80,120)
versanz <- c(20,160,80,40,88,12)

# die aufgabe 4 kann ausgelassen werde (siehe Mail)

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

# 5b) Zeichnen Sie die Histogramme (Anzahl Klassen variieren) von der 
#     Eruptionsdauer

hist(geysir[,"Eruptionsdauer"], breaks=20)

# Was fällt auf? Vergleichen Sie mit der ersten Teilaufgabe.
# >>> je nach dem wie fein/grob die aufteilung ausfällt, können lokale
#     Gruppierungen oder ausreisseische punkte verloren gehen in der 
#     Grafik

# 6) 21 Labors bestimmten den Kupfergehalt von 9 verschiedenen 
#    Klärschlammproben. Die Daten stehen im Data Frame klaerschlamm zur
#    Verfügung. Die erste Spalte bezeichnet das Labor, die restlichen 9
#    Spalten sind die verschiedenen Klärschlammprobe. Die Daten (in mg/kg)
#    kann man mit dem Befehl

url  <- "http://stat.ethz.ch/Teaching/Datasets/klaerschlamm.dat"
schlamm.all  <- read.table(url, header=TRUE)
schlamm  <- schlamm.all[,-1] 

# 6a)

summary(schlamm)
boxplot(schlamm)
