import 'package:bloc/bloc.dart';

import '../../presentation/view_model/customer_account_model.dart';

// Define an enum for the cubit status
enum CustomerAccountCubitStatus { initial, loading, success, error }

class CustomerAccountCubitState {
  final List<CustomerAccountModel> accounts;
  final CustomerAccountCubitStatus status;
  final String errorMessage;

  CustomerAccountCubitState({
    required this.accounts,
    required this.status,
    this.errorMessage = '',
  });

  // Factory methods for different states
  factory CustomerAccountCubitState.initial() {
    return CustomerAccountCubitState(accounts: [], status: CustomerAccountCubitStatus.initial);
  }

  factory CustomerAccountCubitState.loading() {
    return CustomerAccountCubitState(accounts: [], status: CustomerAccountCubitStatus.loading);
  }

  factory CustomerAccountCubitState.success(List<CustomerAccountModel> accounts) {
    return CustomerAccountCubitState(accounts: accounts, status: CustomerAccountCubitStatus.success);
  }

  factory CustomerAccountCubitState.error(String errorMessage) {
    return CustomerAccountCubitState(accounts: [], status: CustomerAccountCubitStatus.error, errorMessage: errorMessage);
  }
}