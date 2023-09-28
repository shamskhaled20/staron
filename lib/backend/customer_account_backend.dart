import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';
import '../database/customer.dart';
void main() async {
  final app = Router();

  // Initialize the database helper for customer accounts
  final customerAccountProvider = CustomerAccountProvider();
  await customerAccountProvider.open(); // Ensure the database is initialized

  // Create a customer account
  app.post('/customerAccounts', (Request request) async {
    final requestBody = await request.readAsString();
    final Map<String, dynamic> data = jsonDecode(requestBody);
    final customerAccount = CustomerAccount.fromMap(data);
    final insertedCustomerId = await customerAccountProvider.insert(customerAccount);
    final insertedAccount = await customerAccountProvider.getCustomerAccount(insertedCustomerId);
    if (insertedAccount != null) {
      return Response.ok(jsonEncode(insertedAccount.toMap()),
          headers: {'Content-Type': 'application/json'});
    } else {
      return Response(500, body: 'Failed to retrieve the created customer account');
    }
  });

  // Get all customer accounts
  app.get('/customerAccounts', (Request request) async {
    final accounts = await customerAccountProvider.getAllAccounts();
    return Response.ok(jsonEncode(accounts),
        headers: {'Content-Type': 'application/json'});
  });

  // Get a specific customer account by customerId
  app.get('/customerAccounts/<customerId>', (Request request, String customerId) async {
    final account = await customerAccountProvider.getCustomerAccount(int.parse(customerId));
    if (account != null) {
      return Response.ok(jsonEncode(account.toMap()),
          headers: {'Content-Type': 'application/json'});
    } else {
      return Response.notFound('Customer account not found');
    }
  });

  // Update a customer account by customerId
  app.put('/customerAccounts/<customerId>', (Request request, String customerId) async {
    final requestBody = await request.readAsString();
    final Map<String, dynamic> data = jsonDecode(requestBody);
    final updatedAccount = CustomerAccount.fromMap(data);
    final success = await customerAccountProvider.update(updatedAccount);
    if (success) {
      final updatedAccount = await customerAccountProvider.getCustomerAccount(int.parse(customerId));
      if (updatedAccount != null) {
        return Response.ok(jsonEncode(updatedAccount.toMap()));
      } else {
        return Response(500, body: 'Failed to retrieve updated customer account');
      }
    } else {
      return Response.notFound('Customer account not found');
    }
  });

  // Delete a customer account by customerId
  app.delete('/customerAccounts/<customerId>', (Request request, String customerId) async {
    final success = await customerAccountProvider.delete(int.parse(customerId));
    if (success) {
      return Response.ok('Customer account deleted');
    } else {
      return Response.notFound('Customer account not found');
    }
  });

  // Serve static files (UI) from a directory
  final staticHandler = createStaticHandler('web', defaultDocument: 'index.html');
  app.mount('/', staticHandler);

  // Start the server
  final server = await io.serve(app, '0.0.0.0', 8080);
  print('Server listening on ${server.address.host}:${server.port}');
}
