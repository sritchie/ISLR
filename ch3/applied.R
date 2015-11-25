## Applied problems from chapter 3

## 8

### a
fit1 = lm(mpg ~ horsepower, data=Auto)
fit2 = lm(mpg ~ I(horsepower^-1), data=Auto)

## Note - looks like this is an inverse relationship, and I get really
## good results with lm(mpg ~ I(horsepower^-1), data = Auto)

summary(fit1)
## Call:
## lm(formula = mpg ~ horsepower, data = Auto)

## Residuals:
##      Min       1Q   Median       3Q      Max
## -13.5710  -3.2592  -0.3435   2.7630  16.9240

## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)
## (Intercept) 39.935861   0.717499   55.66   <2e-16 ***
## horsepower  -0.157845   0.006446  -24.49   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Residual standard error: 4.906 on 390 degrees of freedom
## Multiple R-squared:  0.6059,	Adjusted R-squared:  0.6049
## F-statistic: 599.7 on 1 and 390 DF,  p-value: < 2.2e-16

## Comments on the output:
##
## It looks like there IS a relationship between HP and mpg. The null
## hypothesis has a VERY low chance of being correct, and with that
## huge t-value we can feel pretty good that we've captured the true
## value somewhere in the range. An increase of 1 hp seems to decrease
## mpg by 0.157. 100hp increase is pretty huge; that'd give us 15.7
## mpg less. That's a big deal. So, sure, fairly strong.
##
## The relationship's negative.
##
## for 98 hp, we're expecting 24.467 mpg.
predict(fit1,data.frame(horsepower=98),interval="confidence")
##        fit      lwr      upr
## 1 24.46708 23.97308 24.96108

## prediction interval is way bigger:
predict(fit1,data.frame(horsepower=98),interval="prediction")
##        fit     lwr      upr
## 1 24.46708 14.8094 34.12476

## We get a prediction of 22.43541 for the inverse model.
## Check out the difference between linear and inverse for 350hp:

predict(fit2,data.frame(horsepower=350),interval="confidence")
##        fit      lwr      upr
## 1 9.115488 8.012692 10.21828

predict(fit1,data.frame(horsepower=350),interval="confidence")
##        fit       lwr       upr
## 1 -15.3098 -18.45913 -12.16046

### b)
plot.new()
plot(horsepower, mpg)
abline(fit1)

### c)
plot(fit1)

## Residuals vs fitted dives then goes up. Shows clear
## non-linearity. Q-Q shows the same bowing, same w/ sqrt of
## standardized residuals. Also lots of high residual, high leverage
## points! Not good for our model.

## 9
plot(Auto)
cor(Auto[,-c(9)])
##                     mpg  cylinders displacement horsepower     weight
## mpg           1.0000000 -0.7776175   -0.8051269 -0.7784268 -0.8322442
## cylinders    -0.7776175  1.0000000    0.9508233  0.8429834  0.8975273
## displacement -0.8051269  0.9508233    1.0000000  0.8972570  0.9329944
## horsepower   -0.7784268  0.8429834    0.8972570  1.0000000  0.8645377
## weight       -0.8322442  0.8975273    0.9329944  0.8645377  1.0000000
## acceleration  0.4233285 -0.5046834   -0.5438005 -0.6891955 -0.4168392
## year          0.5805410 -0.3456474   -0.3698552 -0.4163615 -0.3091199
## origin        0.5652088 -0.5689316   -0.6145351 -0.4551715 -0.5850054
##              acceleration       year     origin
## mpg             0.4233285  0.5805410  0.5652088
## cylinders      -0.5046834 -0.3456474 -0.5689316
## displacement   -0.5438005 -0.3698552 -0.6145351
## horsepower     -0.6891955 -0.4163615 -0.4551715
## weight         -0.4168392 -0.3091199 -0.5850054
## acceleration    1.0000000  0.2903161  0.2127458
## year            0.2903161  1.0000000  0.1815277
## origin          0.2127458  0.1815277  1.0000000

## Got some huge correlations here!

### c
fit3 = lm(mpg~.-name, data=Auto)

summary(fit3)
## Call:
## lm(formula = mpg ~ . - name, data = Auto)

## Residuals:
##     Min      1Q  Median      3Q     Max
## -9.5903 -2.1565 -0.1169  1.8690 13.0604

## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)
## (Intercept)  -17.218435   4.644294  -3.707  0.00024 ***
## cylinders     -0.493376   0.323282  -1.526  0.12780
## displacement   0.019896   0.007515   2.647  0.00844 **
## horsepower    -0.016951   0.013787  -1.230  0.21963
## weight        -0.006474   0.000652  -9.929  < 2e-16 ***
## acceleration   0.080576   0.098845   0.815  0.41548
## year           0.750773   0.050973  14.729  < 2e-16 ***
## origin         1.426141   0.278136   5.127 4.67e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Residual standard error: 3.328 on 384 degrees of freedom
## Multiple R-squared:  0.8215,	Adjusted R-squared:  0.8182
## F-statistic: 252.4 on 7 and 384 DF,  p-value: < 2.2e-16

## The null hypothesis, that NOBODY has an effect, is false. r^2 is
## 0.8215. We're looking good.

## Looks like we have a strong relationship between weight and year,
## conditional on the other variables, and a slightly less strong
## correlation (though strong) with origin. Displacement is sort of
## helpful here.
##
## The coefficient for year suggests that the older the car is, or for
## every year, we gain about 0.75 mpg in efficiency.


### d) we're STILL seeing evidence of non-linearity. The residuals vs
### the model are looking bowish. Less so in the third graph, the
### fitted values vs sqrt(standardized residual). We've killed a bunch
### of the high leverage points from before. One or two still remain.

### e)
## weight and acceleration aren't correlated. Looks like horsepower
## and weight has a big effect. Way better to look at
## displacement:horsepower also. How about we use the correlation
## matrix?
##
## Adding displacement*weight had a big effect.the other high
## correlation, displacement*cylinders, didn't really help.

### f)
## Using 1/horsepower did NOT help with the other shit around. This
## guy is looking really good, though - predicting the inverse of mpg:

summary(lm(I(mpg^-1)~.-name,data=Auto))

## 10 - carseat data

### a
summary(lm(Sales~Price+Urban+US))

### b
## It looks like for each increase in price, no matter what the other
## variables are, since they're qualitative, we get a bit of a
## decrease in sales. about 54 less are sold for every buck increase.
##
## The urban coefficient doesn't seem to matter at all. Huge change
## that the null hypothesis is correct for that variable.
##
## The US, though... that has a much higher chance of being
## right. p-value is really low. Looks like we get a 1200 sales unit
## increase across all prices just from being in the US.
##
## Note that the R^2 value is NOT that high here.

### c)
## In the US, urban: (beta0 + beta2 + beta3) + beta1*price
## In the US, non-urban: (beta0 + beta3) + beta1*price
## Out of the US, urban: (beta0 + beta2) + beta1*price
## Out of the US, non-urban: beta0 + beta1*price

### d)
## We can reject the null hypothesis for price and for the US
## qualitative variable.

## e)
carfit=lm(Sales~Price+US)
summary(carfit)

## f) f-statistic is a lot higher in that second one. Wish I had an
## intuition for what exactly it meant! They both have the same value
## of R^2, meaning, they both explain the same amount of variance in
## the data. The f-statistic is higher, so I guess we just have more
## confidence in this model, that what it's saying is correct. RSE
## went down a tiny bit!

## g)
confint(carfit)
##                   2.5 %      97.5 %
## (Intercept) 11.79032020 14.27126531
## Price       -0.06475984 -0.04419543
## USYes        0.69151957  1.70776632

## h) There are, for sure, a few high-leverage, or high residual,
## points.
##
## studentized residuals:
plot(predict(carfit), rstudent(carfit))

## All bounded by [-3,3] so we're looking good for big outliers. The
## plots of the model show high leverage points.

## 11
set.seed(1)
x=rnorm(100)
y=2*x+rnorm(100)
genfit = lm(y~x+0)

### a
summary(genfit)
## Call:
## lm(formula = y ~ x + 0)

## Residuals:
##     Min      1Q  Median      3Q     Max
## -1.9154 -0.6472 -0.1771  0.5056  2.3109

## Coefficients:
##   Estimate Std. Error t value Pr(>|t|)
## x   1.9939     0.1065   18.73   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Residual standard error: 0.9586 on 99 degrees of freedom
## Multiple R-squared:  0.7798,	Adjusted R-squared:  0.7776
## F-statistic: 350.7 on 1 and 99 DF,  p-value: < 2.2e-16

## t-stat is high, p-value is really low, so we're confident that we
## can reject the null hypothesis. The reported slope is 1.9939 with a
## std error of 0.1065. We know that the true slope is 2, so we do
## indeed contain the true value in the interval.
##
## r^2 is pretty high, so we're explaining a good deal of the variance
## with our linear model.

### b
genfit2 = lm(x ~ y + 0)
summary(genfit2)

## Call:
## lm(formula = x ~ y + 0)

## Residuals:
##     Min      1Q  Median      3Q     Max
## -0.8699 -0.2368  0.1030  0.2858  0.8938

## Coefficients:
##   Estimate Std. Error t value Pr(>|t|)
## y  0.39111    0.02089   18.73   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Residual standard error: 0.4246 on 99 degrees of freedom
## Multiple R-squared:  0.7798,	Adjusted R-squared:  0.7776
## F-statistic: 350.7 on 1 and 99 DF,  p-value: < 2.2e-16

## The coefficients are different, of course - presumably the line's
## just flipped across the y = 1 line? (I don't know how to do that
## linear transformation! Linear algebra, come back to me.) The t-stat
## is exactly the same. P-value too. Basically everything about the
## model except the actual coeff and its std error.
tStat = function(x, y) {
    n <- length(x)
    dot <- (x %*% y)
    num <- sqrt(n - 1) * dot
    den <- sqrt((x %*% x) * (y %*% y) - dot^2)
    num / den
}

## Boom! Confirmed that this works.

## e) using this formula, it's clear that it doesn't matter what we
## use as the dependent and independent variables. We're looking for a
## correlation. Does this mean that this number is invariant to linear
## transformations? Ah! tStat(x,y) == tStat(y,x).

## f)
summary(lm(y~x))
summary(lm(x~y))

## Boom.

## 12
##
## a) Looks like it'll only happen when dot(x,x) = dot(y,y), so the
## denoms are the same. Numerators are equal if you flip the
## arguments.

## b)
set.seed(1)
x=rnorm(100)
y=2*x
summary(lm(y~x+0))
summary(lm(x~y+0))

## different.

## c)
sampleY = sample(y)
summary(lm(y~sampleY))
summary(lm(sampleY~y))

## The same! Since the sum of squares of each is the same.

## 13
set.seed(1)
X = rnorm(100)
eps = rnorm(100, sd=0.25)
Y = -1 + 0.5*X + eps

## c)
length(Y) ## 100. In this lm, we have -1 for beta0, 0.5 for beta1.

## d) Nice linear relationship with a little noise! Variance seems constant too. Looks pretty good. I can see that the intercept of the fit I'd do is about 0.5.

## e)
thisfit = lm(Y~X)
summary(thisfit)
confint(thisfit)

## Call:
## lm(formula = Y ~ X)

## Residuals:
##      Min       1Q   Median       3Q      Max
## -0.46921 -0.15344 -0.03487  0.13485  0.58654

## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept) -1.00942    0.02425  -41.63   <2e-16 ***
## X            0.49973    0.02693   18.56   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Residual standard error: 0.2407 on 98 degrees of freedom
## Multiple R-squared:  0.7784,	Adjusted R-squared:  0.7762
## F-statistic: 344.3 on 1 and 98 DF,  p-value: < 2.2e-16

## The estimated parameters are pretty damned close. Their standard
## error definitely contains the true values. We can discount the null
## hypothesis for sure. F-statistic is really big.


## f) The line looks good! Really close to the real line.
plot.new()
plot(X, Y)
abline(thisfit, lwd=3, col=2)
abline(-1, 0.5, lwd=3, col=3)

## Had to copy this.
legend(-1, legend = c("model fit", "pop. regression"), col=2:3, lwd=3)

## g)
polyFit = lm(Y ~ X + I(X^2))

## The t-stat for x^2 is not looking great. The f-stat's way down,
## though the R^2 is pretty close. No compelling evidence that the
## squared term helps.

## h)
set.seed(1)
X = rnorm(100)
eps = rnorm(100, sd=0.05)
Y = -1 + 0.5*X + eps
summary(lm(Y ~ X))
summary(lm(Y ~ X + I(X^2)))
confint(lm(Y ~ X))

## The linear model still does really well when there's not much noise.

## i)
set.seed(1)
X = rnorm(100)
eps = rnorm(100, sd=4)
Y = -1 + 0.5*X + eps
summary(lm(Y ~ X))
confint(lm(Y ~ X))
## When there's so much noise, squared term gives us a 10x on the
## F-statistic, and a little decrease on the residual standard
## error. Both are still bad.

## j)

## medium:
##                  2.5 %     97.5 %
## (Intercept) -1.0575402 -0.9613061
## X            0.4462897  0.5531801

## clean:
##                  2.5 %     97.5 %
## (Intercept) -1.0115080 -0.9922612
## X            0.4892579  0.5106360

## noisy:
##                  2.5 %     97.5 %
## (Intercept) -1.9206430 -0.3808979
## X           -0.3593647  1.3508816

## tighter bands on the clean for sure. Pretty shitty error bands when
## we get into the noisier data.


## 14
set.seed(1)
x1 = runif(100)
x2 = 0.5 * x1 + rnorm(100) / 10
y = 2 + 2*x1 + 0.3*x2 + rnorm(100)

## form of model: y = b0 + b1*x1 + b2*x2 + \epsilon
##
## coeffs are b0 = 2, b1 = 2, b2 = 0.3

## b) correlation:
cor(x1,x2)
## 0.8351212

## Major linear correlation between the two. The plot reflects that.
plot(x1,x2)
fit14 = lm(y ~ x1 + x2)

## Yikes, this is bad news.

summary(fit14)
## Call:
## lm(formula = y ~ x1 + x2)

## Residuals:
##     Min      1Q  Median      3Q     Max
## -2.8311 -0.7273 -0.0537  0.6338  2.3359

## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept)   2.1305     0.2319   9.188 7.61e-15 ***
## x1            1.4396     0.7212   1.996   0.0487 *
## x2            1.0097     1.1337   0.891   0.3754
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Residual standard error: 1.056 on 97 degrees of freedom
## Multiple R-squared:  0.2088,	Adjusted R-squared:  0.1925
## F-statistic:  12.8 on 2 and 97 DF,  p-value: 1.164e-05

## Seems like there's gotta be some way to understand that one
## variable is a function of the other. I don't think that NN have
## this weakness, by the way.
##
## Man, shit's pretty bad. The intercept is okay - 2.13 - but the x1
## has a p-value of 0.0487. Not great. We can just about reject the
## null hypothesis.
##
## The x2 is just shitty, with a p-value of 0.37 and a value of
## 1.0097. The real value is 0.3, of course. We can't reject the null
## hypothesis.
##
## d)
summary(lm(y ~ x1))

## MUCH better. now we have a t-value of 5 and we get it really close,
## 1.9759 when the real value is 2.


summary(lm(y ~ x2))
## Same deal here... MUCH more certain, EXCEPT we totally get it
## wrong. The real term is 0.3. We're predicting that it's 2.9, and we
## have very high confidence.

## f) we do get contradictions. The correlation screws things up for
## the multivariable model because we're adjusting one while keeping
## the other separate, which makes no sense, since they
## correlated. The first test showed that we could barely reject the
## null hypothesis. For the individual variable tests, the p-value was
## far lower, but only with b1 did we actually get the right value.

## g) time to add a really high leverage point:
x1 = c(x1, 0.1)
x2 = c(x2, 0.8)
y = c(y, 6)

## Not an outlier here:
plot(lm(y ~ x1))

## really high leverage here:
plot(lm(y ~ x2))

## HUGE outlier here:
plot(lm(y ~ x1 + x2))

## Adding that point makes x2 much more significant here:
summary(lm(y ~ x1 + x2))

## screws up b1 here, by making it closer to 1.7:
summary(lm(y ~ x1))

## gets even higher here:
summary(lm(y ~ x2))

## 15
library(MASS)
summary(Boston)
Boston$chas <- factor(Boston$chas, labels = c("N","Y"))
summary(Boston)
attach(Boston)
lm.zn = lm(crim~zn)
summary(lm.zn) # yes
lm.indus = lm(crim~indus)
summary(lm.indus) # yes
lm.chas = lm(crim~chas)
summary(lm.chas) # no
lm.nox = lm(crim~nox)
summary(lm.nox) # yes
lm.rm = lm(crim~rm)
summary(lm.rm) # yes
lm.age = lm(crim~age)
summary(lm.age) # yes
lm.dis = lm(crim~dis)
summary(lm.dis) # yes
lm.rad = lm(crim~rad)
summary(lm.rad) # yes
lm.tax = lm(crim~tax)
summary(lm.tax) # yes
lm.ptratio = lm(crim~ptratio)
summary(lm.ptratio) # yes
lm.black = lm(crim~black)
summary(lm.black) # yes
lm.lstat = lm(crim~lstat)
summary(lm.lstat) # yes
lm.medv = lm(crim~medv)
summary(lm.medv) # yes

## Only chas, the charles river dummy variable, had no effect.

## b)
lm.all = lm(crim ~., data=Boston)
summary(lm.all)

## Call:
## lm(formula = crim ~ ., data = Boston)

## Residuals:
##    Min     1Q Median     3Q    Max
## -9.924 -2.120 -0.353  1.019 75.051

## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)
## (Intercept)  17.033228   7.234903   2.354 0.018949 *
## zn            0.044855   0.018734   2.394 0.017025 *
## indus        -0.063855   0.083407  -0.766 0.444294
## chasY        -0.749134   1.180147  -0.635 0.525867
## nox         -10.313535   5.275536  -1.955 0.051152 .
## rm            0.430131   0.612830   0.702 0.483089
## age           0.001452   0.017925   0.081 0.935488
## dis          -0.987176   0.281817  -3.503 0.000502 ***
## rad           0.588209   0.088049   6.680 6.46e-11 ***
## tax          -0.003780   0.005156  -0.733 0.463793
## ptratio      -0.271081   0.186450  -1.454 0.146611
## black        -0.007538   0.003673  -2.052 0.040702 *
## lstat         0.126211   0.075725   1.667 0.096208 .
## medv         -0.198887   0.060516  -3.287 0.001087 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## Residual standard error: 6.439 on 492 degrees of freedom
## Multiple R-squared:  0.454,	Adjusted R-squared:  0.4396
## F-statistic: 31.47 on 13 and 492 DF,  p-value: < 2.2e-16

## We can reject the null hypothesis for dis, rad, medv, black (sort
## of), zn.

## c) The results are pretty different. Points to some serious
## correlation going on, since we were able to love ALL the variables
## before, but now that they're together, we're hosed again.

x = c(coefficients(lm.zn)[2],
      coefficients(lm.indus)[2],
      coefficients(lm.chas)[2],
    coefficients(lm.nox)[2],
      coefficients(lm.rm)[2],
      coefficients(lm.age)[2],
      coefficients(lm.dis)[2],
      coefficients(lm.rad)[2],
      coefficients(lm.tax)[2],
      coefficients(lm.ptratio)[2],
      coefficients(lm.black)[2],
      coefficients(lm.lstat)[2],
      coefficients(lm.medv)[2])
y = coefficients(lm.all)[2:14]
plot(x, y)

## The coefficient for nox, the nitrogen oxides concentration, is -10
## in the whole model, 31 in the univariate model.

## d
lm.zn = lm(crim~poly(zn,3))
summary(lm.zn) # 1, 2
lm.indus = lm(crim~poly(indus,3))
summary(lm.indus) # 1, 2, 3
# lm.chas = lm(crim~poly(chas,3)) : qualitative predictor
lm.nox = lm(crim~poly(nox,3))
summary(lm.nox) # 1, 2, 3
lm.rm = lm(crim~poly(rm,3))
summary(lm.rm) # 1, 2
lm.age = lm(crim~poly(age,3))
summary(lm.age) # 1, 2, 3
lm.dis = lm(crim~poly(dis,3))
summary(lm.dis) # 1, 2, 3
lm.rad = lm(crim~poly(rad,3))
summary(lm.rad) # 1, 2
lm.tax = lm(crim~poly(tax,3))
summary(lm.tax) # 1, 2
lm.ptratio = lm(crim~poly(ptratio,3))
summary(lm.ptratio) # 1, 2, 3
lm.black = lm(crim~poly(black,3))
summary(lm.black) # 1
lm.lstat = lm(crim~poly(lstat,3))
summary(lm.lstat) # 1, 2
lm.medv = lm(crim~poly(medv,3))
summary(lm.medv) # 1, 2, 3
