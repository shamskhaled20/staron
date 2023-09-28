import 'package:bloc/bloc.dart';

import '../../presentation/view_model/customer_account_model.dart';
import '../api_account_customer.dart';

class CustomerAccountCubit extends Cubit<List<CustomerAccountModel>> {
  final CustomerAccountApi _api = CustomerAccountApi();

  CustomerAccountCubit() : super([]);

  void fetchCustomerAccounts() async {
    try {
      final accounts = await _api.fetchAllCustomerAccounts();
      emit(accounts);
    } catch (e) {
      // Handle error, e.g., emit an error state
    }
  }

  void createCustomerAccount(Map<String, dynamic> data) async {
    try {
      await _api.createCustomerAccount(data);
      fetchCustomerAccounts(); // Refresh the list after creating an account
    } catch (e) {
      // Handle error, e.g., emit an error state
    }
  }

  void updateCustomerAccount(int accountId, Map<String, dynamic> updatedData) async {
    try {
      await _api.updateCustomerAccount(accountId, updatedData);
      fetchCustomerAccounts(); // Refresh the list after updating an account
    } catch (e) {
      // Handle error, e.g., emit an error state
    }
  }

  void deleteCustomerAccount(int accountId) async {
    try {
      await _api.deleteCustomerAccount(accountId);
      fetchCustomerAccounts(); // Refresh the list after deleting an account
    } catch (e) {
      // Handle error, e.g., emit an error state
    }
  }
}
