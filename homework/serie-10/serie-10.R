##### Serie 10

# 1a)
anzahl.zerfaelle <- c(2:17)
anzahl.beobachtungen <- c(18, 28, 56, 105, 126, 146, 164, 161, 123, 101, 74, 53, 23, 15, 9, 5)
zerfaelle.total <- sum(anzahl.zerfaelle*anzahl.beobachtungen)

# 1b)
messung <- rep(anzahl.zerfaelle, anzahl.beobachtungen)
hist(messung, breaks=c(0:20)) # einfache variante (17 zerfälle 5 mal gemessen)
# luxus-variante
# hist(messung, breaks=c(0, anzahl.zerfaelle[-16], 25)

# 1c)
# genau wie bei 1b) ???

# 1d)
wahrscheinlichkeiten <- anzahl.beobachtungen/sum(anzahl.beobachtungen)
plot(anzahl.zerfaelle, wahrscheinlichkeiten, type='h')

# 1e)
mittel <- mean(messung)
standardabweichung <- sd(messung)
plot(anzahl.zerfaelle, wahrscheinlichkeiten, type='h')
abline(v=mittel, col="red") # arithmetisches Mittel eintragen
lines(x=c(mittel-standardabweichung, mittel+standardabweichung), y=c(0.05, 0.05), col="blue")# bereich der standardabweichung eintragen

# 1f)
plot(sort(messung), (1:n)/n, type='s')

# machen später weiter an der aufgabe

##### Aufgabe 2

Erwartungswert <- 32
Standardabweichung <- 6

# 2a)
plot(10:60, dnorm(x=10:60, mean=Erwartungswert, sd=Standardabweichung), type='l')
abline(v=26, col='red')
abline(v=38, col='red')

# 2b)
# ich hätte einfach folgendes gemacht
pnorm(q=40, mean=Erwartungswert, sd=Standardabweichung)
# was genau mit der "standardisierten Zufallsvariablen Z" sein soll? K.A.!!!

# 2c)
pnorm(q=27, mean=Erwartungswert, sd=Standardabweichung)

# 2d)
qnorm(p=0.975, mean=Erwartungswert, sd=Standardabweichung)


