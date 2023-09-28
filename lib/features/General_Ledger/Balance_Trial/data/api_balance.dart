import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://0.0.0.0:8080'; // Update with your server URL

  Future<Map<String, double>> fetchTrialBalance() async {
    final response = await http.get(Uri.parse('$baseUrl/trialBalance'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final Map<String, double> trialBalance = data.map((key, value) => MapEntry(key, value as double));
      return trialBalance;
    } else {
      throw Exception('Failed to load trial balance');
    }
  }
}
