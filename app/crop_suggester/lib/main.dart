import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'datamodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crop Suggester',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<String> models = [
    'DecisionTree',
    'GaussianNaiveBayes',
    'LogisticRegression',
    'RandomForest',
    'XGBoost',
    'CustomDecisionTree',
    'CustomGaussianNaiveBayes',
    'CustomLogisticRegression',
    'CustomRandomForest',
    'CustomXGBoost',
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late double N, P, K, temperature, humidity, ph, rainfall;
  late String selectedModel = 'CustomRandomForest';

  Future<String> postRequest(Request req) async {
    final url = Uri.parse('https://crop-predict-api.onrender.com/predict');
    final response = await http.post(
      url,
      body: json.encode(req.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to make POST request');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crop Suggester')),
      bottomSheet: Container(
        height: 50,
        color: Colors.brown.shade800,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hari Sankar. R S B.Sc. CS S2',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(width: 8),
              Text(
                '© ${DateTime.now().year} MIC',
                style: const TextStyle(color: Colors.white70),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // N
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Nitrogen'),
                  onChanged: (value) => N = double.tryParse(value) ?? 0.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),

                // P
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Phosphorous'),
                  onChanged: (value) => P = double.tryParse(value) ?? 0.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),

                // K
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Potassium'),
                  onChanged: (value) => K = double.tryParse(value) ?? 0.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),

                // temperature
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Temperature in Celsius'),
                  onChanged: (value) =>
                      temperature = double.tryParse(value) ?? 0.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),

                // humidity
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Humidity'),
                  onChanged: (value) =>
                      humidity = double.tryParse(value) ?? 0.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),

                // ph
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'pH Value'),
                  onChanged: (value) => ph = double.tryParse(value) ?? 0.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),

                // rainfall
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Rainfall in mm'),
                  onChanged: (value) =>
                      rainfall = double.tryParse(value) ?? 0.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),

                DropdownButtonFormField(
                  value: selectedModel,
                  items: models.map((String model) {
                    return DropdownMenuItem<String>(
                      value: model,
                      child: Text(model),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    selectedModel = value ?? 'CustomRandomForest';
                  },
                  decoration: const InputDecoration(
                      labelText:
                          'ML Model - (CustomRandomForest is recommended)'),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final req = Request(
                        N: N,
                        P: P,
                        K: K,
                        temperature: temperature,
                        humidity: humidity,
                        ph: ph,
                        rainfall: rainfall,
                        model: selectedModel,
                      );
                      postRequest(req)
                          .then(
                            (response) => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Crop Suggestion'),
                                  content: Text(
                                      "The best crop to cultivate in this condition is: $response"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    )
                                  ],
                                );
                              },
                            ),
                          )
                          .catchError(
                            (error) => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: Text(error.toString()),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
