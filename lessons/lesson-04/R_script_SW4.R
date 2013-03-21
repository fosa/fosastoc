# Ich ziehe ein Los (size=1) und wiederhole das Zufallsexperiment 100 mal

rbinom(n=100,size=1,prob=0.2)

# Anzahl Gewinne

sum(rbinom(n=100,size=1,prob=0.2))

# Ich ziehe auf einmal 100 Lose, dann ist die Anzahl Gewinne

rbinom(n=1,size=100,prob=0.2)

# Wie gross ist die Wahrscheinlichkeit, 20 Gewinne mit 100 Losen zu erzielen? Dazu gehe ich 100 mal zur Losbude

Anzahl.Versuche <- 100
Anzahl.Gewinne <- rbinom(n=Anzahl.Versuche,size=100,prob=0.2)
Anzahl.Gewinne
sum(Anzahl.Gewinne==20)

Wkeit <- sum(Anzahl.Gewinne==20)/Anzahl.Versuche
Wkeit

# Wie gross ist die Wahrscheinlichkeit, 20 Gewinne mit 100 Losen zu erzielen? Dazu gehe ich 1000 mal zur Losbude

Anzahl.Versuche <- 1000
Anzahl.Gewinne <- rbinom(n=Anzahl.Versuche,size=100,prob=0.2)
Anzahl.Gewinne
sum(Anzahl.Gewinne==20)

Wkeit <- sum(Anzahl.Gewinne==20)/Anzahl.Versuche
Wkeit

# Mit dbinom kann man die Wkeit, 20 Gewinne mit 100 Losen zu erzielen, berechnen

dbinom(20,size=100,prob=0.2)

plot(1:100,dbinom(x=1:100,size=100,prob=0.2),type="h")
dbinom(1:100,size=100,prob=0.2)

# Kumulative Verteilungsfunktion

cum.binom <- pbinom(1:100,size=100,prob=0.2)
cum.binom
plot(1:100,pbinom(1:100,size=100,prob=0.2),type="s")
par(new=TRUE)
plot(1:100,pbinom(1:100,size=100,prob=0.2),pch="o")
