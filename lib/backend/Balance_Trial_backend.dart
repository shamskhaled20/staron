import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:staron/database/db_%20Account_Table.dart';


void main() async {
  final app = Router();
  final databaseHelper = DatabaseHelperBalanceTrial();

  // Endpoint to insert a journal entry
  app.post('/journalEntry', (Request request) async {
    final requestBody = await request.readAsString();
    final data = jsonDecode(requestBody);
    final accountId = data['accountId'] as int;
    final debit = data['debit'] as double;
    final credit = data['credit'] as double;

    await databaseHelper.insertJournalEntry(accountId, debit, credit);
    await databaseHelper.updateAccountBalance(accountId, debit - credit);

    return Response.ok('Journal entry inserted and account balance updated');
  });

  // Endpoint to calculate and retrieve the trial balance
  app.get('/trialBalance', (Request request) async {
    final trialBalance = await databaseHelper.calculateTrialBalance();
    final trialBalanceJson = jsonEncode(trialBalance);

    return Response.ok(
      trialBalanceJson,
      headers: {'Content-Type': 'application/json'},
    );
  });

  // Start the server
  final server = await io.serve(app, '0.0.0.0', 8080);
  print('Server listening on ${server.address.host}:${server.port}');
}
