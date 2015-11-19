## Chapter 2 Applied Exercises

library("ISLR")

## 8c

## i
summary(College)

## ii
## Sick! Lots of little plots.
pairs(College[,1:10])

## iii
## Private colleges have more out of state folks.
plot(College$Private, College$Outstate)

## iv
## This creates a new row called "Elite", with "No" for everyone.
Elite = rep("No", nrow(College))
Elite[College$Top10perc > 50] = "Yes"
Elite = as.factor(Elite)
College = data.frame(College, Elite)
plot(College$Elite, College$Outstate)

##v
hist(College$Apps)
hist(College$perc.alumni, col=2)
hist(College$S.F.Ratio, col=3, breaks=10)
hist(College$Expend, breaks=100)

## Elite colleges spend more on their kids.
plot(College$Elite, College$Expend)

## Correlation between top 10% and grad rate... but it's not that
## great of a correlation.
plot(College$Top10perc, College$Grad.Rate)

## 9
## a)
## quantitative: mpg, displacement, hp, weight, acceleration
## qual: year, name, cylinders, origin

## b) range:
sapply(Auto[,-c(2,7,8,9)], range)
##       mpg displacement horsepower weight acceleration
## [1,]  9.0           68         46   1613          8.0
## [2,] 46.6          455        230   5140         24.8

## c)mean:
##      mpg displacement   horsepower       weight acceleration
## 23.44592    194.41199    104.46939   2977.58418     15.54133

## std-dev:
##      mpg displacement   horsepower       weight acceleration
## 7.805007   104.644004    38.491160   849.402560     2.758864

## d) now remove 10-85.
sapply(Auto[-c(10:85),-c(2,7,8,9)], range)
##       mpg displacement horsepower weight acceleration
## [1,] 11.0           68         46   1649          8.5
## [2,] 46.6          455        230   4997         24.8

sapply(Auto[-c(10:85),-c(2,7,8,9)], mean)
##      mpg displacement   horsepower       weight acceleration
## 24.40443    187.24051    100.72152   2935.97152     15.72690

sapply(Auto[-c(10:85),-c(2,7,8,9)], sd)
##      mpg displacement   horsepower       weight acceleration
## 7.867283    99.678367    35.708853   811.300208     2.693721

## e
pairs(Auto)
plot(Auto$mpg, Auto$weight)

## Cars are definitely getting more efficient over time!
plot(Auto$year, Auto$mpg)

##f suppose we want to predict gas mileage based on the other variables.
## Let's make a gallons per 100 mile column.
gp100 = 100 / Auto$mpg
newAuto = data.frame(Auto, gp100)
pairs(newAuto)

## boom! This new feature looks like it makes more sense. The previous
## inverse relationship's now a direct relationship.
##
## Looks like displacement, horsepower and weight are all good
## predictors. Cylinders are helpful too, though not as much signal.
##
## Cars are getting more efficient over time... but it's not that huge
## a signal either. Pretty fuzzy. I guess a linear model with
## regularization would kill that idea?


## 10
library(MASS)
nrow(Boston); ncol(Boston); # 506x14

## Every row is a town. Every column is some feature of information
## about that town.

## (b)
pairs(Boston)

## Huh. Definitely some correlation between nox and indus. More nox happens in areas with higher industrial... lstat and medv definitely correlated.

## (c)
##
## age and dis seem to be correlated with crime. The farther away you
## get, the less crime there is (maybe because they stick them in the
## middle of urban centers?)

## (d)
hist(Boston$crim[Boston$crim>1], breaks=25)
hist(Boston$tax, breaks=25)
hist(Boston$ptratio, breaks=25)

## (e) - 35 suburbs
dim(subset(Boston, Boston$chas == 1))

## (f) - 19.05
median(Boston$ptratio)

## (g)

t(subset(Boston, Boston$medv == min(Boston$medv)))
##              399      406
## crim     38.3518  67.9208
## zn        0.0000   0.0000
## indus    18.1000  18.1000
## chas      0.0000   0.0000
## nox       0.6930   0.6930
## rm        5.4530   5.6830
## age     100.0000 100.0000
## dis       1.4896   1.4254
## rad      24.0000  24.0000
## tax     666.0000 666.0000
## ptratio  20.2000  20.2000
## black   396.9000 384.9700
## lstat    30.5900  22.9800
## medv      5.0000   5.0000


## Total ranges for everything:
t(sapply(Boston, range))
##              [,1]     [,2]
## crim      0.00632  88.9762
## zn        0.00000 100.0000
## indus     0.46000  27.7400
## chas      0.00000   1.0000
## nox       0.38500   0.8710
## rm        3.56100   8.7800
## age       2.90000 100.0000
## dis       1.12960  12.1265
## rad       1.00000  24.0000
## tax     187.00000 711.0000
## ptratio  12.60000  22.0000
## black     0.32000 396.9000
## lstat     1.73000  37.9700
## medv      5.00000  50.0000

## average crime, no zn... super black, high lstat, ptratio is on the
## really high end... taxes are really high too.

## (h)
dim(subset(Boston, rm > 7))

## 64 average more than 7 rooms per dwelling.
dim(subset(Boston, rm > 8))

## 13 average more than 8 rooms per dwelling.
summary(subset(Boston, rm > 8))
