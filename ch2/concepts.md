# Concept questions from the book

## 1

a) with large n, small p, we'd want a MORE flexible method, since we have a great set of test data to pull from the n. We're not as worried about overfitting with a large n.

b) With small n and large p, we're worried about overfitting, so we want more structure in the model.

c) Highly nonlinear - we want a flexible method so we can capture the nonlinearity.

d) Super high variance? We want more structure, less flexibility, so we don't try to fit the noise in the data.

## 2

a) n is 500 (firms), p is 4 (all except salary). This is a regression problem, since we want to predict the real-valued salary. We're interested in understanding the factors, so we're interested in inference.

b) n = 20 (products). p=13. classification problem, for "success" or "failure". Presumably we also care about inference a little so we can tweak the inputs, since we set all of those... but I think the answer's prediction, since we only care what we get.

c) n = 52 (weeks of data). p=3 (changes in all except US). Regression problem, since we want to predict the percentage change. We're interested in prediction as the problem states.

## 3

a) [[https://github.com/asadoughi/stat-learning/blob/master/ch2/3a.jpg][@asadoughi's drawing is solid.]]

b) Bias goes down as you get more flexible, because there's less structure to "insist" that the answer's wrong. As the predicted curves bounce around for different training sets, the bounce around the actual true mean value for each point.

Variance goes up, since the models are going to be more flexible, and can adjust much more to the training set.

Test error goes down then up, since bias bottoms out but variance keeps rising. The great performance on the training dataset that comes with flexibility kills the test performance due to overfitting.

Training error goes down, down, down to zero as the flexible model can just hit every point in the training set.

Bayes, or irreducible, error stays constant, since the model by definition can't affect it.
