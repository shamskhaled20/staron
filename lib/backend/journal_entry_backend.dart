import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';
import '../database/db_journal_entry.dart';

void main() async {
  final app = Router();

  // Initialize the database helper
  final databaseHelper = DatabaseHelperJournal();
  await databaseHelper.init(); // Ensure the database is initialized

  // Create a journal entry
  app.post('/journalEntries', (Request request) async {
    final requestBody = await request.readAsString();
    final Map<String, dynamic> data = jsonDecode(requestBody);
    final journalEntry = JournalEntry.fromMap(data);
    final insertedEntryId = await databaseHelper.insertJournalEntry(journalEntry);
    final insertedEntry = await databaseHelper.getJournalEntry(insertedEntryId);
    if (insertedEntry != null) {
      return Response.ok(jsonEncode(insertedEntry.toMap()),
          headers: {'Content-Type': 'application/json'});
    } else {
      return Response(500, body: 'Failed to retrieve updated journal entry');
    }
  });

  // Get all journal entries
  app.get('/journalEntries', (Request request) async {
    final entries = await databaseHelper.getAllJournalEntries();
    return Response.ok(jsonEncode(entries),
        headers: {'Content-Type': 'application/json'});
  });

  // Get a specific journal entry by entryId
  app.get('/journalEntries/<entryId>', (Request request, String entryId) async {
    final entry = await databaseHelper.getJournalEntry(int.parse(entryId));
    if (entry != null) {
      return Response.ok(jsonEncode(entry.toMap()),
          headers: {'Content-Type': 'application/json'});
    } else {
      return Response.notFound('Journal entry not found');
    }
  });

  // Update a journal entry by entryId
  app.put('/journalEntries/<entryId>', (Request request, String entryId) async {
    final requestBody = await request.readAsString();
    final Map<String, dynamic> data = jsonDecode(requestBody);
    final updatedEntry = JournalEntry.fromMap(data);
    final success = await databaseHelper.updateJournalEntry(int.parse(entryId), updatedEntry);
    if (success) {
      final updatedEntry = await databaseHelper.getJournalEntry(int.parse(entryId));
      if (updatedEntry != null) {
        return Response.ok(jsonEncode(updatedEntry.toMap()));
      } else {
        return Response(500, body: 'Failed to retrieve updated journal entry');
      }
    } else {
      return Response.notFound('Journal entry not found');
    }
  });

  // Delete a journal entry by entryId
  app.delete('/journalEntries/<entryId>', (Request request, String entryId) async {
    final success = await databaseHelper.deleteJournalEntry(int.parse(entryId));
    if (success) {
      return Response.ok('Journal entry deleted');
    } else {
      return Response.notFound('Journal entry not found');
    }
  });

  // Serve static files (UI) from a directory
  final staticHandler = createStaticHandler('web', defaultDocument: 'index.html');
  app.mount('/', staticHandler);

  // Start the server
  final server = await io.serve(app, '0.0.0.0', 8080);
  print('Server listening on ${server.address.host}:${server.port}');
}

