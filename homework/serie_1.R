################################################################################
# R-Einführungsübung (SW1/Serie 1)
################################################################################

# Aufgabe 1 - Visualisierung von Daten und Berechnung von Kenngrössen
# 
#     Das Dataframe d.fuel enthält die Daten verschiedener Fahrzegue aus einer 
#     amerikanischen Untersuchung der 80er-Jahre. Jede Zeile (row) enthält die
#     Daten eines Fahrzeuges (ein Fahrzeug entspricht einer Beobachtung).


# 1a) einlesen der Daten
t.file <- "http://stat.ethz.ch/Teaching/Datasets/NDK/d.fuel.dat"
d.fuel <- read.table(t.file,header=T,sep=",")

# 1b) betrachten der eingelesenen Daten 
d.fuel

# 1c) fünften Eintrag auswählen aus d.fuel
d.fuel[5,]

# 1d) erste bis fünfte Beobachtung des Datensatzes
d.fuel[1:5,]

# 1e) zeige 1. bis 3. und 57. bis 60. Beobachtung des Datensatzes
d.fuel[c(1:3,57:60),]

# 1f) Berechne Mittelwert der Reichweiten aller Autos im Miles/Gallon
mean(apply(d.fuel[3], 1, mean))
# oder
mpg <- d.fuel[,3]
mean(mpg)

# 1g) Berechne Mittelwert der Reichweiten der Autos 7 bis 22.
mean(mpg[7:22])

# 1h) Erzeuge neuen Vektor t.kml welcher alle Reichweiten in km/l enthält
#     "                    t.kg  welcher alle Gewichte in kg enthält
#     1 Mile    = 1.609344   km    
#     1 Gallon  = 3.78541178 Liter
#     1 Pound   = 0.45359    kg
#     => 1 Mile/Gallon = 1.609344/3.78541178 km/Liter = 0.425143708 km/Liter
mpg2kml <- 0.425143708
p2kg <- 0.45359
t.kml <- mpg * mpg2kml
t.kg <- weight * p2kg

# 1i) Berechne Mittelwert der Reichweiten in km/l und denjenigen der Gewichte
#     in kg
mean(t.kml)
mean(t.kg)

# 1j) Zeichne ein Streudiagramm, welches den Verbrauch pro 100km als Funktion
#     des Gewichtes in kg darstellt.
#     100 / t.kml = l/100km
t.lp100km <- 100 / t.kml
plot(t.kml, t.lp100km)


# 1k) Machen Sie eine Stamm-Blatt-Darstellung der Benzinverbräuche pro 100km.
#     Bestimmen Sie den minimalen und maximalen Verbrauch.
#     >>> Hinweis: stem()
stem(t.lp100km)
# Frage: Die einzelnen Werte kann ich nicht nachvollziehen (auch mit z.B. 
#        'scale=2'). So ist bei 13 l/100km ein Wert von 13.1111 angegebenm,
#        jedoch ist der maximale Wert 13.06748 (erhalten mit max(t.lp100km)).
min(t.lp100km)
max(t.lp100km)

# 1l) Zeichnen Sie zuerst ein Histogramm des Verbrauchs der Autos (pro 100km)
#     mit den Defaulteinstellungen und dann ein Histogramm mit 15 Klassen 
#     statt nur 8, einer x-Achse von 0 bis 15 und einem Titel.
hist(t.lp100km, breaks=15, xlim=c(0,15),main=paste("Verbrauch pro 100km"))

# 1m) Zeichnen Sie einen Boxplot der Benzinverbräuche.
#     R-Hinweis: boxplot()
boxplot(t.lp100km)

# 1n) Vergleichen Sie die Standardabweichung und den MAD der Benzinverbräuche 
#     miteinander (vgl. Stat. Datenanalyse, Kap. 2.3).
#     R-Hinweis: mad(), sd()
mad(t.lp100km)
sd(t.lp100km)
# Frage: Das Buch auf welches verwiesen wird ist nicht frei verfügbar.
#        Können wir relevante Ausschnitte davon erhalten oder sollten wir ein
#        Exemplar erwerben?

# 1o) Vergleichen Sie den Mittelwert und den Median der Benzinverbräuche in 
#     l/100km.
mean(t.lp100km)
mad(t.lp100km)

# Aufgabe 2 - Korrelationen

# 2a) Erzeugen Sie den Vektor t.x mit den Werten -10,-9,...,9,10 und den Vektor
#     t.x1 mit den Werten 0,1,...,9,10. Erzeugen Sie dann die Vektoren t.y und 
#     t.y1, deren Elemente die Quadratwerte der entsprechenden Elemente von t.x
#     bzw. t.x1 enthalten.
t.x <- c(-10:10)
t.x1 <- c(0:10)
t.y <- t.x^2
t.y1 <- t.x1^2

# 2b) Zeichnen Sie die Streudiagramme t.y vs. t.x und t.y1 vs t.x1 .
plot(t.x, t.y)
plot(t.x1, t.y1)

# 2c) Berechnen Sie die Korrelationskoeffizienten zwischen t.x und t.y bzw. 
#     zwischen t.x1 und t.y1. Warum sind die beiden Korrelationen so verschieden
#     (vgl. Stat. Datenanalyse, Abschnitt 3.2.h)?
cor(t.x, t.y)
cor(t.x1, t.y1)
# Der Korrelationskoeffizient beschreibt den Grad des 'linearen Zusammenhangs'.
# Dieser kann im Bereich -1 bis +1 liegen. Ist der Wert 0 so besteht kein 
# Zusammenhang.
#
# Frage: Das Buch haben wir immer noch nicht... (siehe Aufgabe 1n)

# Kommentare
#
# A) Das Aufgabenblatt hat im TeX-Code keine Anpassung für die deutschen Umlaute
#    Mögliche Lösung: Folgende Zeilen in die Präambel einfügen
#
#       \usepackage[utf8]{inputenc}     % für input utf8
#       \usepackage[T1]{fontenc}        % Schriftcodierung mit UTF-8
#       \usepackage{textcomp}           % Erweiterung von fontenc
#       \usepackage{lmodern}            % Erweiterung des Zeichensatzes
