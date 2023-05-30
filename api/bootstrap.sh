#!/bin/sh

export FLASK_APP=./crop_predict/predict.py

pipenv run flask run -h 0.0.0.0
