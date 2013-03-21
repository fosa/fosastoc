################################################################################
# Serie 4 - Strochastik
################################################################################

# Aufgabe 1 - Ein Stand auf einem Volksfest bietet ein Würfelspiel an. Man wirft
# zwei sechsseitige Würfel. Je nach Ausgang des Wurfs muss man Geld bezahlen 
# oder man erhält Geld. Hier sind die Regeln des Spiels:
# (1) Bei einem Pasch gewinnt der Spieler 10 Fr.
# (2) Bei (1,2) und (2,1) gewinnt der Spieler 20 Fr.
# (3) Bei allen anderen Kobinationen verliert der Spieler 4 Fr.

# 1a) Sei X die Zufallsvariable, die den Gewinn des Spielers nach einem Wurf
# angibt. Bestimmen Sie die Wahrscheinlichkeitverteilung.

# Anzahl Kombinationen  36
spiel.combos <- 36

# 10-Fr. Kombinationen   6
spiel.win10 <- 6

# 20-Fr. Kombinationen   2
spiel.win20 <- 2

# Looser Kombinationen  36-(6+2)=28
spiel.loose <- spiel.combos - (spiel.win10 + spiel.win20)

#       x               0               1               2
#       k (Gewinn)      -4 Fr.          +10 Fr.         +20 Fr. 
#       ________________________________________________________________
#       
#       P(X=x)          28/36 = 7/9     6/36 = 1/6      2/36 = 1/18

# 1b) Würden Sie dieses Spiel spielen? Überlegen Sie sich eine Möglichkeit, wie
# man mit einer zahl angeben kann, ob sich das Spiel lohnt oder nicht.

# Da man alle möglichen Ereignisse kennt und dere Wahrscheinlichkeit, kann eine
# aussage darüber gemacht werden, wie hoch der "durchschnittliche" Gewinn ist.

# E = (7/9)*(-4) + (1/6)*(+10) + (1/18)*(+20) = -1/3
# Der "durchschnittliche" Gewinn beträgt also -1/3 d.h. es ist ein Verlustspiel.

################################################################################

# Aufagbe 2 - Bei einer Untersuchung werden Wasserproben (10ml) auf Verunreini-
# gungen untersucht. Da nur 2 Prozent aller Proben verunreinigt sind, wird vor-
# geschlagen, von 10 Einzelproben jeweils die Hälfte (5ml) der Proben zu einer 
# Sammelprobe (50ml) zusammenzumischen und zunächst nur die Sammelprobe zu un-
# tersuchen. Wird in der Sammelprobe keine Verunreinigung festgestellt, so ist
# die Untersuchung für die 10 Einzeluntersuchungen beendet. Im anderen Fall
# werden alle 10 übriggebliebenen Hälften in 10 Einzeluntersuchungen geprüft.

# 2a) Wie gross ist die Wahscheinlichkeit, in der Sammelprobe keine Verunreinni-
# gung zu finden (unter der Annahme, dass die Einzelproben unabhängig vonein-
# ander sind)?

# Diese Aufgabe lässt sich mit der Binomialreihe
#       X~Bin(n!((x!(n-x)!))*p^x*(1-p)^(n-x)
# lösen wobei
# n = 10        Anzahl Proben
# x = 0         (1 = verschmutzt, 0 = sauber)
# p = 0.02      (2% sind verunreinigt)
# P(X=x)=Bin(10 0) * 0.02^0 * (1-0.02)^(10-0) = 0.817
# oder man rechnet es einfach per   0.98^(10) = 0.817

# 2b) Sie die Zufallsvariable Y die Gesamtzahl benötigter Analysen. Welche Wer-
# te kann Y annahmen, und mit welchen Wahrshceinlichkeiten treten sie auf?

# Gedankenexperiment: Wir machen eine Sammelprobe und sie ist sauber. Wie viele
# Analysen sind insgesamt nötig? Genau eine, denn die Probe ist ja sauber.
# Haben wir eine verschmutzte Sammelprobe, so müssen wir die Sammelprobe analy-
# sieren als auch 10 weitere Proben (Ursprünge der Sammelprobe).
# Somit ergibt sich folgender Zusammenhang:
#
# Y = 1         P(Y=1) = 0.817          (alles ist sauber)
# Y = 11        P(Y=11)= 1-0.817=0.183  (verunreinigte Sammelprobe)

# 2c) Wieviele Analysen werden im Durchschnitt für die gesamte Untersuchung be-
# nötigt (d.h. wie gross ist der Erwartungswert von Y (E[Y]) )? Wieviele Analy-
# sen werden durch die Bildung von Sammelproben "im Durchschnitt" eingespart?

# Der Erwartungswert von Y berechnet sich durch die Summe der Wahrscheinlich-
# keiten der Ereignisse, welche mit der Anzahl Analysen noch multipliziert wer-
# den, d.h.

# E[Y] = (1 * P(Y=1)) + (11 * P(Y=11))
#      =  1 * 0.817   +  11 * 0.183
#      = 2.83
# Dieser Wert sagt aus, wie viele Untersuchungen "im Durchschnitt" nötig sind
# für 10 Proben. D.h. wir können nun sagen wie viele Analysen wir dadurch ein-
# sparen nämlich:
# 10 - 2.83 = 7.17

################################################################################

# Aufgabe 3 - Ein Hersteller von Reagenzgläsern möchte sicherstellen, dass eine
# grosse Lieferung weniger als 10% minderwertige Gläser enthält (Qualitätsstufe
# A). Zwecks Qualitätssicherung entnimmt er der Lieferung eine zufällige Stich-
# probe im Umfang von fünfzig Gläsern. Es stellt sich heraus, dass von diesen
# fünfzig Gläsern drei minderwertig sind. Für den Hersteller stellt sich nun 
# das Problem, aufgrund der gezogenen Stichprobe zu entscheiden, ob er tatsäch-
# lich beruhigt davon ausgehen kann, dass die ganze Lieferung einen Anteil min-
# derwertiger Gläser < 10% enthält oder ob es als plausibel gelten kann, dass 
# er in der Stichprobe “rein zufällig“ einen Anteil minderwertiger Gläser unter
# 10% erwischt hat, obwohl die ganze Lieferung in Tat und Wahrheit einen Anteil
# minderwertiger Gläser von 10% oder mehr aufweist.

# 3a) Welches Modell bzw. welche Verteilung beschreibt die Anzahl minderwerti-
# ger Gläser in der Stichprobe unter der Annahme, dass die einzelnen Gläser un-
# abhängig sind?

# Die Verteilung welche dies Beschreibt ist die Binominalverteilung nach Ber-
# noulli.

# 3b) Wie gross ist die Wahscheinlichkeit, dass die gezogene Stichprobe genau
# drei minderwertige Gläser enthält, wenn der wahre Anteil minderwertiger Glä-
# ser in der Lieferung 10% beträgt?

# n = 50        (Anzahl Proben)
# p = 0.1       (10% Toleranz)
# x = 3         (minderwertige Proben; 1=schlecht, 0=gut)
# Die Binominalverteilung usw. kann gut mit R berechnet werden lassen

dbinom(3, size=50, prob=0.1)

# Das Ergebnis ist 0.1385651

# 3c) Wie gross ist die Wahscheinlichkeit, dass die gezogene Stichprobe höch-
# stens drei minderwertige Gläser enthält, wenn die Lieferung einen Anteil 
# von 10% minderwertiger Gläser enthält?

# Um die Wahscheinlichkeit zu erhalten, müssen die Wahscheinlichkeiten aller
# möglichen Ereignisse summiert werden.

sum(dbinom(0:3, size=50, prob=0.1))

# 3d) Der Hesteller kann Stichproben nehmen zu Qualitätssicherung, jedoch muss
# die Anzahl Proben und die tolerierte Fehlerquote so gewählt werden, dass er
# davon ausgehen kann, dass die Ware/Lieferung gut ist. D.h. z.B. statt 50 
# Proben nimmt er 100 Proben und/oder statt einer Quote von 10% Fehler nimmt
# er eine etwas tiefere und schaut die Ladung genauer an bei einer überschrei-
# tung. So könnte er die Kontrolle optimieren, jedoch nie für die Gesamte Ware
# garantieren, da er ja dann alle* Teile testen müsste.

################################################################################

# Aufgabe 4 - Verwende R um folgende Grössen zu berechnen. 
# Es sei X ~ Bin(50,0.2)

# 4a) P(X=10)

# Die Frage lautet ausformuliert "Wie gross ist die Wahscheinlichkeit, dass 10
# Treffer erfolgen, wenn die Trefferquote bei 50 Würfen 0.2 beträgt"

dbinom(10, size=50, prob=0.2)

# Die Antwort auf diese Frage lautet: P(X=10) = 0.139819

# 4b) P(X<=5)

sum(dbinom(0:5, size=50, prob=0.2))

# P(X<=5) = 0.04802722

# 4c) P(X>=15)

sum(dbinom(15:50, size=50, prob=0.2))

# P(X>=15) = 0.06072208

# 4d) Finde c sodass P(X<=c) ca. 0.99




################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################


