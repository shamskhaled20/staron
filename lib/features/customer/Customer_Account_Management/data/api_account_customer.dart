import 'dart:convert';
import 'package:http/http.dart' as http;

import '../presentation/view_model/customer_account_model.dart';

class CustomerAccountApi {
  final String baseUrl = 'http://0.0.0.0:8080'; // Your API base URL

  Future<http.Response> createCustomerAccount(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/customerAccounts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    return response;
  }

  Future<List<CustomerAccountModel>> fetchAllCustomerAccounts() async {
    final response = await http.get(Uri.parse('$baseUrl/customerAccounts'));

    if (response.statusCode == 200) {
      final List<dynamic> accountsData = jsonDecode(response.body);
      final List<CustomerAccountModel> customerAccounts = accountsData.map((data) => CustomerAccountModel.fromMap(data)).toList();
      return customerAccounts;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<http.Response> updateCustomerAccount(int accountId, Map<String, dynamic> updatedData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/customerAccounts/$accountId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(updatedData),
    );

    return response;
  }

  Future<http.Response> deleteCustomerAccount(int accountId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/customerAccounts/$accountId'),
    );

    return response;
  }
}
