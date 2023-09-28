import 'dart:js';

import 'package:go_router/go_router.dart';
import '../../features/General_Ledger/Journal_Entry/presentation/view/Journal_Entry.dart';
import '../../features/General_Ledger/Journal_Entry/presentation/view/widget/add_change_Journal_Entry.dart';
import '../../features/General_Ledger/navigation_top_general_ledger.dart';
import '../../features/Supplier/Supplier_Account_Management/presentation/view/supplier_account_view.dart';
import '../../features/Supplier/Supplier_Payment_Terms_Management/presentation/view/supplier_payment_view.dart';
import '../../features/Supplier/Supplier_nvoice_Management/presentation/view/Supplier_Invoice_Management_view.dart';
import '../../features/customer/Customer_Account_Management/presentation/view/Customer_Account_Management_view.dart';
import '../../features/customer/Customer_Payment_Terms_Management/presentation/view/Customer_Payment_Terms_Management.dart';
import '../../features/customer/Customer_invoice_Management/presentation/view/Customer_Invoice_Management.dart';
import '../../features/navigation_in_bottom_app.dart';

abstract class AppRouter{
  static const kJournalEntryForm ='/JournalEntryForm';
  static const kBalanceTrialView ='/BalanceTrialView';
  static const kClosingPeriodsView ='/ClosingPeriodsView';
  static const kChartofAccountsView ='/ChartofAccountsView';

  static final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) =>
              home()
              //SupplierInvoiceView()
              //SupplierPaymenttView()
              //SupplierAccountView()
          //CustomerInvoiceView()
              //CustomerPaymenttView()
              //CustomerAccountView()
              //navigation_in_top_general_ledger()
          //CustomerAccountView()
              //ChartofAccountsView()
              //ClosingPeriodsView()
              //ListTrialBalance()
            //  Journal_Entry(),
        ),
        GoRoute(path: kJournalEntryForm,builder: (context,state)=> JournalEntryForm())
      ]);
}