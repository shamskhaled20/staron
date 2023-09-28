import 'dart:convert';
import 'package:http/http.dart' as http;

import '../presentation/view_model/journal_entry_model.dart';

class ApiService {
  final String baseUrl = 'http://0.0.0.0:8080'; // Your API base URL
  Future<http.Response> createJournalEntry(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/journalEntries'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    return response;
  }

  Future<List<JournalEntryModel>> fetchAllJournalEntries() async {
    final response = await http.get(Uri.parse('$baseUrl/journalEntries'));

    if (response.statusCode == 200) {
      final List<dynamic> entries = jsonDecode(response.body);
      final List<JournalEntryModel> journalEntries = entries.map((e) => JournalEntryModel.fromMap(e)).toList();
      return journalEntries;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<http.Response> updateJournalEntry(int entryId, Map<String, dynamic> updatedData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/journalEntries/$entryId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(updatedData),
    );

    return response;
  }

  Future<http.Response> deleteJournalEntry(int entryId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/journalEntries/$entryId'),
    );

    return response;
  }
}
