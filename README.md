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

 __________________________
|                    |     |
|____________________|_____|
    *Training set*     *Test set*

Based on the data we have, we can split the data using 2 methods either by splitting the whole data into two by using the function `train_test_split` defined in the python library `scikit-learn` or by dividing the whole data into 22 parts (each part containing features of 22 crops), and then using the same `train_test_split` function now on each parts and finally combining all into a final training and test set.
We will do both method and analyse the accuracy at the end.

## Machine Learning Algorithms Used:
#### Decision Tree

Decision Tree is one of the most popular machine learning algorithms. A decision tree is a non-parametric supervised learning algorithm, which is utilized for both classification and regression tasks.
It has a hierarchical, tree structure, which consists of a root node, branches, internal nodes and leaf nodes. It uses a simple technique, wherin a yes/no question is asked and according to the answer the tree is split in smaller nodes. To determine how the features of a dataset should split nodes to form the tree, a measurement called Gini impurity is used.
One of the limitations of decision trees is that they are largely unstable compared to other decision predictors. A small change in the data can result in a major change in the structure of the decision tree, which can convey a different result from what users will get in a normal event.

