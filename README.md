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

You can access the dataset [here](https://www.kaggle.com/datasets/atharvaingle/crop-recommendation-dataset)

