# Crop Suggester

Suggest crop based on soil and weather data.

---

## Introduction & Motivation

The farming sector is a major contributor to the Indian economy. Agriculture is largely influenced by natuaral conditions of its sorroundings and hence faces number of challenges in actual farming practices. One of the major problem of farmers are they don't choose the right crop based on their soil requirements. Due to this they face a serious setback in productivity and profit in crop yield. 
And that's where *precision agriculture* comes in help and can have major effects on agricultural sector.
**Precision Agriculture** refers to the use of advanced technologies and data analytics to optimize farming practices and improve crop yields. It uses research data of soil characteristics, soil types, crop yield data collection and gives the right suggestions to the farmers about the right crop based on their site-specific parameters.
This reduces the wrong choice on a crop and increases crop yield and productivity.

## Goal

To create a ML model that recommend optimum crops to be cultivated by farmers based on various parameters including soil contents and weather data of the field and create a user friendly UI in Flutter to make the system more accessible to the common user.

## About the data

#### Context

This dataset was build by augmenting datasets of rainfall, climate and fertilizer data available for India.

#### Data fields

- `N` - ratio of Nitrogen content in soil
- `P` - ratio of Phosphorous content in soil
- `K` - ratio of Potassium content in soil
- `temperature` - temperature in degree Celsius
- `humidity` - relative humidity in %
- `ph` - ph value of the soil
- `rainfall` - rainfall in mm
- `label` - name of the crop

You can access the dataset [here](https://www.kaggle.com/datasets/atharvaingle/crop-recommendation-dataset)

## Feature and target selection

Before using any ML algorithm we first need select the **Feature** and **Target** variables from the dataset.

- **Feature:** Features are individual independent variables that act as the input in your system. Prediction models use features to make predictions. More simply, you can consider one column of your data set to be one feature. Sometimes these are also called attributes. And the number of features are called dimensions.
- **Target:** The target is whatever the output of the input variables. It could be the individual classes that the input variables maybe mapped to in case of a classification problem or the output value range in a regression problem. If the training set is considered then the target is the training output values that will be considered.

In our case the target is `label` which contains the name of the crop that will grow based on the given conditions. And the features will be: `N`, `P`, `K`, `temperature`, `humidity`, `ph`, and `rainfall`.

## Splitting Data into Training and Test sets.

A machine learning model aims to make good predictions on new, previously unseen data. But if you are building a model from your data set, how would you get the previously unseen data?
Well, one way is to divide your data set into two subsets training set and testing set. The training set is a subset of the original dataset which is used to train the model and the test set is also a subset to test the trained model.

Based on the data we have, we can split the data using 2 methods either by splitting the whole data into two by using the function `train_test_split` defined in the python library `scikit-learn` or by dividing the whole data into 22 parts (each part containing features of 22 crops), and then using the same `train_test_split` function now on each parts and finally combining all into a final training and test set.
We will do both method and analyse the accuracy at the end.

## Machine Learning Algorithms Used:
#### Decision Tree

Decision Tree is one of the most popular machine learning algorithms. A decision tree is a non-parametric supervised learning algorithm, which is utilized for both classification and regression tasks.
It has a hierarchical, tree structure, which consists of a root node, branches, internal nodes and leaf nodes. It uses a simple technique, wherin a yes/no question is asked and according to the answer the tree is split in smaller nodes. To determine how the features of a dataset should split nodes to form the tree, a measurement called Gini impurity is used.
One of the limitations of decision trees is that they are largely unstable compared to other decision predictors. A small change in the data can result in a major change in the structure of the decision tree, which can convey a different result from what users will get in a normal event.

#### Gaussian Naive Bayes

Gaussian Naive Bayes (GNB) is a classification technique used in Machine Learning based on the probabilistic approach and Gaussian distribution.
Gaussian Naive Bayes assumes that each feature has an independent capacity of predicting the output variable. Its advantages is that it doesn't require as much training data. 
It handles both continuous and descrete data. It is highly scalable with the number of predictors and data points. It is fast and can be used to make real-time predictions.

#### Logistic Regression

It is one of the simplest algorithms in machine learning. It is used for solving classification problems. It uses a sigmoid function to mathematically calculate the probability of an event belonging to a certain class. The algorithm creates a linear decision boundary and applies the sigmoid function transform the output into a probability between 0 and 1.
This makes it suitable for problems where the target variable is categorical or binary. It can handle large datasets efficiently and provides easily interpretable coefficients, allowing us to understand the impact of each feature on the predicted outcome.
It can handle large datasets efficiently and provides easily interpretable coefficients, allowing us to understand the impact of each feature on the predicted outcome. 

#### Random Forest

Random Forest is a supervised ensemble machine learning algorthm used in both classification as well as regression problems. It operats by constructing an ensemble of decision trees and combining their predictions to make a final prediction. Each decision tree in the forest is trained on a randomly selected subset of the data and a random subset of features.
During prediction, the output from all trees is averaged or aggregated to obtain the final result.
As decision tree are prone to overfitting, random forest is useful in reducing the effect of overfitting and hence giving a more accurate output.

#### XGBoost

XGBoost (eXtreme Gradient Boosting) is a popular and powerful machine learning algorithm that belongs to the gradient boosting family. It is a tree-based algorithm using gradient boosting framework. This algorithm is based on a feedback approach, where feedback from the decistion tree is taken so as to improve the decision tree further as it "boosts" the efficiency of the tree and helps 
in bringing out a better accuracy. It employs a gradient descent algorithm to optimize the objective function, which includes both a loss function and a regularie term.
XGBoost provides several advantages including high predictive accuracy, scalability, and the ability to handle a variety of data types.
