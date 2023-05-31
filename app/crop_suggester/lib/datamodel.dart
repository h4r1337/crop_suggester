class Request {
  final double N;
  final double P;
  final double K;
  final double temperature;
  final double humidity;
  final double ph;
  final double rainfall;
  final String model;

  Request({
    required this.N,
    required this.P,
    required this.K,
    required this.temperature,
    required this.humidity,
    required this.ph,
    required this.rainfall,
    required this.model,
  });

  Map<String, dynamic> toJson() {
    return {
      'N': N,
      'P': P,
      'K': K,
      'temperature': temperature,
      'humidity': humidity,
      'ph': ph,
      'rainfall': rainfall,
      'model': model,
    };
  }
}
