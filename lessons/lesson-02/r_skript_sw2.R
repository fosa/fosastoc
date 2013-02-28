f# Semesterwoche 2

## Datensatz Schmelzwärme

methode.A <- c(79.98,80.04,80.02,80.04,80.03,80.03,80.04,79.97,80.05,80.03,80.02,80.00,80.02)
methode.B <- c(80.02,79.94,79.98,79.97,79.97,80.03,79.95,79.97)

schmelzwärme <- list(A=methode.A,B=methode.B)
schmelzwärme$A
schmelzwärme

schmelzwärme <- data.frame(methode.A,methode.B) ## dataframe funktioniert nur für gleiche Dimensionen

## Datensatz Bluttplättchenaggregation

vorher <- c(25,25,27,44,30,67,53,53,52,60,28)
nachher <- c(27,29,37,56,46,82,57,80,61,59,43)

aggregation <- data.frame(vorher,nachher)
aggregation
aggregation$vorher

## Arithmetisches Mittel

n <- length(methode.A)
n
mean.methode.A <- sum(methode.A)/n
mean.methode.A
mean(methode.A)

## Standardabweichung

s.deviation.A <- sqrt(1/(n-1)*sum((methode.A-mean.methode.A)^2))
s.deviation.A
sd(methode.A)
  
## Quantile - Beispiel 25%-Quantil

methode.B.sortiert <- sort(methode.B)
methode.B.sortiert
length(methode.B) ## gerade Anzahl von Datenpunkten

alpha <- 0.25 ## 25%-Quantil

alpha*length(methode.B) ## alpha*n ist eine ganze Zahl
methode.B.sortiert[alpha*length(methode.B)]
methode.B.sortiert[alpha*length(methode.B)+1]
quantil.methode.B <- 0.5*(methode.B.sortiert[alpha*length(methode.B)]+methode.B.sortiert[alpha*length(methode.B)+1])
quantil.methode.B

quantile(methode.B,0.25,type=2)
help(quantile)

## 25% Quantil Methode A

methode.A.sortiert <- sort(methode.A)
methode.A.sortiert
length(methode.A) ## alpha*n ist keine gerade Zahl

alpha*length(methode.A) ## alpha*n ist keine ganze Zahl

round(alpha*length(methode.A)+0.5)
quantil.methode.A <- methode.A.sortiert[round(alpha*length(methode.A)+0.5)]

quantil.methode.A

quantile(methode.A,0.25,type=2)

## Robustheit von Median

median(methode.A)
sort(methode.A)
mean(methode.A)

methode.A.mod <- methode.A
methode.A.mod[9] <- 800.5

mean(methode.A.mod)
median(methode.A.mod)

## Empirische Kovarianz und empirische Korrelation und Varianz


cor(aggregation$vorher,aggregation$nachher) ## Korrelation


cov(aggregation$vorher,aggregation$nachher)  ## Kovarianz

1/(length(aggregation$vorher)-1)*sum((aggregation$vorher-mean(aggregation$vorher))*(aggregation$nachher-mean(aggregation$nachher)))
help(cov)

var(aggregation$vorher)  ## Varianz
(sd(aggregation$vorher))^2

## Standardisierung

methode.A.standard <- scale(methode.A)
methode.A.standard
mean(methode.A.standard)
sd(methode.A.standard)

## Einfache lineare Regression

seitenzahl <- c(50,100,150,200,250,300,350,400,450,500)
buchpreis <- c(6.4,9.5,15.6,15.1,17.8,23.4,23.4,22.5,26.1,29.1)

verlagskosten <- data.frame(seitenzahl,buchpreis)
verlagskosten

plot(seitenzahl,buchpreis)

cor(buchpreis,seitenzahl)

lm.verlagskosten <- lm(buchpreis ~ seitenzahl)

lines(seitenzahl,fitted(lm.verlagskosten))
segments(seitenzahl,fitted(lm.verlagskosten),seitenzahl,buchpreis)

summary(lm.verlagskosten)

## Histogramm

sort(methode.A)
hist(methode.A)
brk <- c(79.96,80.00,80.02,80.04,80.06)
hist(methode.A,breaks=brk)
hist(methode.A,breaks=10)

## Boxplot

boxplot(methode.A,methode.B)

## Empirische kumulative Verteilungsfunktion

n <- length(methode.A)
n
(1:n)/n
plot(sort(methode.A),(1:n)/n,type="s",ylim=c(0,1))

## Streudiagramm

plot(aggregation$vorher,aggregation$nachher)
