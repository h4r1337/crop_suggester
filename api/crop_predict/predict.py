from flask import Flask, request, jsonify
import pickle
import numpy as np

app = Flask(__name__)

model_files = {
    'DecisionTree': '/usr/src/app/models/DecisionTree.pkl',
    'GaussianNaiveBayes': '/usr/src/app/models/NBClassifier.pkl',
    'LogisticRegression': '/usr/src/app/models/LogisticRegression.pkl',
    'RandomForest': '/usr/src/app/models/RandomForest.pkl',
    'XGBoost': '/usr/src/app/models/XGBoost.pkl',
    'CustomDecisionTree': '/usr/src/app/models/CustomDecisionTree.pkl',
    'CustomGaussianNaiveBayes': '/usr/src/app/models/CustomNBClassifier.pkl',
    'CustomLogisticRegression': '/usr/src/app/models/CustomLogisticRegression.pkl',
    'CustomRandomForest': '/usr/src/app/models/CustomRandomForest.pkl',
    'CustomXGBoost': '/usr/src/app/models/CustomXGBoost.pkl',

}

@app.route('/predict', methods=['POST'])
def predict():
    # Retrieve query parameters from the request
    data = request.get_json()

    N = data['N']
    P = data['P']
    K = data['K']
    temperature = data['temperature']
    humidity = data['humidity']
    ph = data['ph']
    rainfall = data['rainfall']

    model_name = data['model']
    if model_name not in model_files:
        return 'Invalid model name', 400
    
    model_file = model_files.get(model_name)
    with open(model_file, 'rb') as f:
        model = pickle.load(f)

    input_data = np.array([[N, P, K, temperature, humidity, ph, rainfall]])
    prediction = model.predict(input_data)

    # Convert the predicted labels back to their original values
    if model_name == 'XGBoost' or model_name == 'CustomXGBoost':
        # LabelEncoder object used to train XGBoost and CustomXGBoost model
        with open('/usr/src/app/models/label_encoder.pkl', 'rb') as f:
            label_encoder = pickle.load(f)

        original_prediction = label_encoder.inverse_transform(prediction)
        return jsonify(original_prediction)

    return jsonify(prediction)

