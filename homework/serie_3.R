################################################################################
# Serie 3 - Stochstik
################################################################################

# Aufgabe 1 - Eine Regressionsgerade hat die GLeichung y = m*x + 7.8. Der Durch-
# schnitt der x-Werte beträgt 7, derjenige der y-Werte ist 12. die Standardab-
# weichungen betragen s_x = 2.5 und s_y = 1.8

# 1a) Berechnen Sie die Kovarianz zwischen den x- und den y-Werten.

# 1b) Berechnen Sie den Korrelationskoeffizienten r.

################################################################################

# Aufgabe 2 - die Ereignisse A und B seien unabhängig mit Wahrscheinlichkeiten
# P(A)=3/4 und P(B)=2/3. Berechnen Sie die Wahscheinlichekten folgender Ereig-
# nisse:

# 2a) Beide Ereignisse treten ein.

# Wahrscheinlichkeit P(A) = 3/4
prob.a <- 3/4
# Wahrscheinlichkeit P(B) = 2/3
prob.b <- 2/3
# P(A und B) ist P(A)*P(B) da beide unabhängig sind
prob.a * prob.b

# 2b) Mindestens eines von beiden Ereignissen tritt ein.

# d.h. es tritt ein: A, B, A und B. Das bedeutet P=P(A)+P(B)-(P(A)*P(B))
prob.a + prob.b - (prob.a * prob.b)

# 2c) Höchstens eines von beiden Ereignissen tritt ein.

# d.h. es tritt ein: keines, A, B. 
# Das bedeutet P = NOT(P(A) & P(B)) = P(Omega-(P(A) und P(B))) wobei Omega=1
1 - (prob.a * prob.b)

# 2d) Keines der beiden Ereignisse tritt ein.

# d.h. es tritt ein: Omega ohne (A oder B)
1 - (prob.a + prob.b - (prob.a * prob.b))

# 2e) Genau eines der Ereignisse tritt ein.

# d.h. es tritt ein: A oder B
# Das bedeutet P = P(A) + P(B) - 2*P(A und B)

prob.a + prob.b - 2*(prob.a * prob.b)

################################################################################

# Aufgabe 3 - Die Rauchsensoren in einer Fabrik melden ein Feuer mit Wahrschein-
# lichkeit 0.95. An einem Tag ohne Brand geben sie mit Wahrscheinlichkeit 0.01
# falschen Alarm. Pro Jahr rechnet man mit einem Brand.

# 3a) Die Alarmanlage meldet Feuer. Mit welcher Wahrscheinlichkeit brennt es 
# tatsächlich?

prob.feuer  <- 1/365    # Wahscheinlichkeit dass es brennt (1 mal pro Jahr)
prob.kfeuer <- 355/365  # W. dass es nicht brennt 
prob.alarm  <- 0.95     # W. dass Alarm ausgelöst wird bei Brand
prob.kalarm <- 0.01     # W. dass kein Alarm ausgelöst wird bei Brand

# Die Ereignisse sind nicht unabhängig! D.h. es gilt die bedingte Wahrschein-
# lichkeit (das Theorem von Bayes) welche P(A|B)=(P(A und B))/(P(B)) beschreibt.
# Mit den gegebenen Informationen lässt sich eine Tabelle aufstellen:
#
#                       Feuer           kein Feuer
#
#       Alarm           (1/365)*0.95    (355/365)*0.01
#
#       kein Alarm      (1/365)*0.05    (355/365)*0.99
#
# Die Wahrscheinlichkeit dass es brennt wenn der Alarm ausschlägt ist
# P(Feuer|Alarm) = P(Feuer UND Alarm) / P(Alarm)

(prob.feuer * prob.alarm) / prob.alarm

# 3b) In einer Nacht is es ruhig (kein Alarm). Mit welcher Wahrscheinlichkeit 
# brennt es tatsächlich nicht?

# Aus der Tabelle kann man entnehmen, dass die Wahscheinlichkeit wie folgt ist
# P(keinFeuer|keinAlarm) = P(keinFeuer UND keinAlarm) / P(keinAlarm)

(prob.kfeuer * prob.kalarm) / prob.kalarm

################################################################################

# Aufgabe 4 - Bei einem Zufallsexperiment werden zwei Würfel gleichzeitig ge-
# worfen. Wir nehmen an, dass sie "fair" sind, d.h. die Augenzahlen 1 bis 6 
# eines Würfels treten mit gleicher Wahrscheinlichkeit auf.

# 4a) Beschreiben Sie den Ereignisraum in Form von Elementaterreignissen.

# Omega = {(i,j): 1 <= i <= 6, 1 <= j <= 6} 
#       = {(1,1),(1,2),(1,3),(1,4),(1,5),(1,6)
#          (2,1),(2,2),(2,3),(2,4),(2,5),(2,6)
#          (3,1),(3,2),(3,3),(3,4),(3,5),(3,6)
#          (4,1),(4,2),(4,3),(4,4),(4,5),(4,6)
#          (5,1),(5,2),(5,3),(5,4),(5,5),(5,6)
#          (6,1),(6,2),(6,3),(6,4),(6,5),(6,6)}

# 4b) Wie gross ist die Wahscheinlichkeit eines einzelnen Elementarereignisses?

# Da die Wahscheinlichkeiten für jede Augenzahl gleich ist gibt es eine line-
# are verteilung d.h. 1:(6*6) bzw. 1/36 bzw. 1/"Anzhal Möglicher Ereignisse"

# 4c) Berechnen Die die Wahrscheinlichkeit, dass das Ereignis E_1 "Die Augen-
# summe ist 7" eintritt.

wurf.A <- c(1:6)
wurf.B <- c(1:6)
combos  <- expand.grid(wurf.A, wurf.B)
combosums <- c(combos[,1] + combos[,2])
length(Filter(function(x) x==7, combosums))

# E_1 = {(1,6),(2,5),(3,4),(4,3),(5,2),(6,1)} somit gibt es 6 Ereignisse die
# die Augnesumme 7 ergeben. Somit ist P(E_1) = 6/36 = 1/6

# 4d) Wie gross ist die Wahrscheinlichkeit, dass das Ereignis E_2 "Die Augen-
# summe ist kleiner als 4" eintritt.

length(Filter(function(x) x<4, combosums))

# E_2 = {(1,1),(1,2),(2,1)} somit gibt es 3 Ereignisse welche die Augensumme
# kleiner 4 haben. D.h. P(E_3) = 3/36 = 1/12

# 4e) bestimmen Sie P(E_3) für das Ereignis E_3 "Beide Augenzahlen sind unge-
# rade".

is.even <- function(combos) combos %% 2 == 0
Map(function(x,y) x==TRUE && y==TRUE, is.even(combos[,1]), is.even(combos[,2]))
evencombo <- c(Map(function(x,y) x==TRUE && y==TRUE, is.even(combos[,1]), is.even(combos[,2])))
length(evencombo[evencombo==TRUE])

# E_3 = {(1,1),(1,3),(1,5),(3,1),(3,3),(3,5),(5,1),(5,3),(5,5)} somit gibt es
# 9 Ereignisse bei denen beide Augenzahlen ungerade sind. Somit ergibt sich 
# eine Wahrscheinlichkeit von P(E_3) = 9/36 = 1/4

# 4f) Berechnen Sie P(E_2 ODER E_3).

# P(E_2 ODER E_3) = P(E_2) + P(E_3) - P(E_2 * E_3)
#                 = 1/12   + 1/4    - (1/12 * 1/4) 
#                 =  

################################################################################

################################################################################

################################################################################

################################################################################
