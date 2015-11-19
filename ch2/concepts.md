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

## 4

a) Classification ideas:
- classifying various body types based on what people eat, what they lift, how their weight changes. "hardgainer", etc. Goal here is just prediction.
- Classifying a race as some difficulty level of trail race; again, we just care about prediction.
- Classifying ThinkFun's customers as likely to order again or not. This is inference, since we want to know how to CHANGE the inputs to affect the output.

b) Regression ideas:
- Split time prediction during an ultra. Interested in prediction, don't care how complicated the model gets.
- predicted # of registrations for a SUP race based on time of year, etc. (inference, since we want to know also how to affect stuff.)
- Guessing twitter traffic at some point in time. Also, we just care about predictions, since we want to increase our load in advance. Accuracy matters most.

c) Cluster analysis:
- Trying to figure out if a particular piece of forest is in a protected, or at risk, cluster
- Bucketing someone's heart rate data into pre-workout and post-workout, maybe?
- Figuring out if there are different cohorts, or types of runners, in an ultra race. What populations are there? Do different strategies work?

## 5

This question is about the tradeoffs between less and more flexible approaches.

If we have a ton of data, a more flexible approach is going to be good, because the volume of data is going to help protect against variance. We're protected against overfitting if we have a huge # of points.

If we don't, the data itself doesn't have much structure, so we need the model to provide that structure for us. If we think we know the relationship, we may want to assume that structure in the model at the risk of having a less flexible system that presupposes that it knows what's going in.

Same for classification. A super flexible classification algorithm is going to give a very wiggly, custom boundary between the classes. If there's a lot of uncertainty in the data a flexy algorithm is going to lie about how much error it's resolved, without a solid test dataset.

## 6

In parametric learning, the problem of learning a model is much simpler since we're tuning parameters on an existing, structured model. We're sitting at the high-bias, low-variance end of the spectrum.

Using non-parametric learning runs the risk of overfitting; without a bunch of data and a solid test set, it's going to be difficult to tune a model like this (a smoother, or KNN, for example).

Parametric learning is much better for inference, since it's clearer what's going on. The parameters are weights within some structured model, probably linear. With a non-parametric model you get the entire, possibly really hard to understand surface back from the algorithm. It's very difficult to eyeball and predict based on that surface.

Non-parametric learning can capture non-linear relationships well, though. If you really care just about prediction you may lean this way.

## 7

a) distances: 3, 2, sqrt(10) = 3.162278, sqrt(5) = 2.236068, sqrt(2) = 1.414214, sqrt(3) = 1.732051
b) K = 1 - then we classify it as Green, since that's sqrt(2) away. Closest point.
c) K = 3 - we have Red, Green, Red, so we classify it as Red.
d) with a really non-linear decision boundary, I'd expect a LOW value for K to get closest to the Bayes classifier. A really high value of K is going to take too many points into account, and give us linear-looking boundaries between the various classes. A lower value for K will allow the classifier to meander more closer to the boundaries, since points far from the boundaries will have less of an effect.
