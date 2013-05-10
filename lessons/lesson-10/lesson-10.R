##### Serie 10 - Aufgabe 1a

# Anzahl Experimente
n <- c(18, 28, 56, 105, 126, 146, 164, 161, 123, 101, 74, 53, 23, 15, 9, 5)

# Gemessene Zerfälle
m <- c(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17)

# Tupel bilden
paare <- cbind(m, n)

##### Serie 10 - Aufgabe 1a

# Gesamtzahl der Zerfälle berechnen
messungen <- sum(n*m)

# Messungen replizieren
mess <- rep(m,n)

summary(messungen)

##### Serie 10 - Aufgabe 1b
hist(mess, breaks=c(0, 2:17, 20), freq=FALSE)

##### Serie 10 - Aufgabe 1d
plot(m, n, type='h')

##### Serie 10 - Aufgabe 1e
wkeit <- n/sum(n)
plot(m, wkeit, type='h', )
mean(mess)
sd(mess)

##### Serie 10 - Aufgabe 1f
N <- length(mess)
plot(sort(mess), (1:N)/N, type='s')

##### Serie 10 - Aufgabe 1h
1-ppois(q=(20-1), lambda=8.37)
# wir landen so viele male in diesen Bereich 
1000000 * (1-ppois(q=(20-1), lambda=8.37))

##### Serie 10 - Aufgabe 1k
curve(dexp(x, rate=0.837), from=0, to=6)
abline(v=1.2, col='red')
lines(x=c(1.19-1.19, 1.19+1.19), y=c(0.08, 0.08), col='blue')


##### Serie 10 - Aufgabe 
##### Serie 10 - Aufgabe 
##### Serie 10 - Aufgabe 
##### Serie 10 - Aufgabe 

