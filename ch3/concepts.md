# Concepts for Chapter 3

## 1

The null hypotheses for the p values in table 3.4 correspond to:

- for the intercept - the hypothesis that without TV, radio or newspaper, the product would have zero sales. The p-value is < 0.0001 with a t-stat of 9.42, meaning that the chances that this hypothesis is true are incredibly small. Far more likely that there are in fact sales.

- For TV, the null hypothesis is that spending on TV (for a given amount of fixed spending on radio and newspaper) doesn't change sales. The t-stat is 32.81, meaning that if indeed TV doesn't change sales, our data is 32 standard deviations away from the mean. Basically never gonna happen.

- For radio, slightly less unlikely; the p-value is the probability that radio has no effect either way on sales, given a fixed value of spending on TV and newspaper.

- The newspaper null hypothesis is that newspaper spending has no effect, given TV and radio spending. The value is 0.8599, indicating that the chances that this hypothesis is true are actually pretty high. An increase in newspaper spending has a tiny negative effect on sales by the numbers, but the std deviation is high enough that this is most likely just noise.

## 2

KNN regression, for every point in the domain, sets the output as the average value of the K nearest neighbors. Each point's interpreted as a value, so we can average between them.

Classification does a very similar thing, but assigns a class to every point in space based on the most frequent classification in the K nearest neighbors.

So in a sense they're exactly the same; the classifier averages the class probabilities, while regression averages the actual values.

## 3
a:
i) false. For a fixed value of IQ and GPA, women earn more than men on average.
ii) true.
iii) true - the slope for a male's GPA effect is higher.
iv) false, for the opposite reason of above.

b:
4.0, IQ 110 - 85 + 40 + (0.07 +0.04)*110 = 137.1 ($137,100.00 per year)

c:
False - there is NOT necessarily very little evidence. We can't actually tell without knowing the sample error. You can have an effect that's small in magnitude with a very low p value. Confidence and the size of the effect aren't necessarily related.

## 4
a) If the true relationship is linear - I'd expect the training RSS to MAYBE be lower for the cubic function, since it can wander around through the noise to get closer to various points. The more data we have, the closer the functions will be, but if there aren't that many points (as in n=100 here) we might have a case of overfitting. It depends on Var(epsilon), so maybe also not enough info.

b) With the test TSS, I'd expect the linear model to do better, since the variance of the cubic would have caused overfitting, pulling the cubic function's predictions away from new values it hasn't seen before.

c) Not enough info to tell. Depending on how nonlinear it is, if it's CLOSE to linear, the noise is high and we don't have that many points, we might want to go with linear anyway, since a polynomial function is going to chase and overfit the data. The more points we have and the more non-linear we can discern, the worse the linear model is going to do (due to bias) vs the cubic model.

The answer [here](https://github.com/asadoughi/stat-learning/blob/master/ch3/answers) points out, and I guess this is true, that no matter what a more flexible model is going to do better on the training set, since it can follow the points. Good call.

d) Not enough info to tell here. the more non-linear the data actually is, the better the cubic will do on the test data. If the fit's really linear then the linear structure is going to help the linear classifier, and the variance of the cubic will hurt it.

## 5
Worked this out in my notebook. Simple.

## 6
Okay, look at 3.4. The intercept term is beta0 = y_bar - beta1 * x_bar.

Rearrange to get (y_bar - beta0) / (x_bar - 0) = beta1. Slope is rise over run, and we know we have (0, beta0) as a point and beta1 as the slope... so, good to go!

## 7
Done in the notebook. Key is that if we know the mean is zero we can simplify and get beta0 is zero. Take the approach used, then just plug in the big boys, don't expand beta1 until the end and you're good to go.
