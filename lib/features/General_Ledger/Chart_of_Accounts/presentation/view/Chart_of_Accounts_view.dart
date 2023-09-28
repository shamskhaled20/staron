import 'package:flutter/material.dart';
import 'package:staron/core/utits/textstyles.dart';
import 'package:staron/features/General_Ledger/Chart_of_Accounts/presentation/view/widget/Chart_of_Accounts_body.dart';

class ChartofAccountsView extends StatefulWidget {
  ChartofAccountsView({Key? key}) : super(key: key);

  @override
  _ChartofAccountsViewState createState() => _ChartofAccountsViewState();
}

class _ChartofAccountsViewState extends State<ChartofAccountsView> {
  List<Account> chartOfAccounts = []; // Placeholder for chart of accounts data

  // Simulate fetching chart of accounts data from an API
  void fetchChartOfAccounts() {
    // Replace this with actual API call logic
    // For now, we'll use sample data
    setState(() {
      chartOfAccounts = [
        Account(accountNumber: '101', accountName: 'Cash', balance: 1000.0),
        Account(accountNumber: '201', accountName: 'Accounts Receivable', balance: 500.0),
        Account(accountNumber: '301', accountName: 'Supplies', balance: 300.0),
        Account(accountNumber: '401', accountName: 'Equipment', balance: 2000.0),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchChartOfAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Chart of Accounts'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularChart(chartOfAccounts: chartOfAccounts),
              SizedBox(height: 20),
              if (chartOfAccounts.isNotEmpty)
                DataTable(
                  columns: [
                    DataColumn(label: Text('Account Number',style: Styles.textStyle12,)),
                    DataColumn(label: Text('Account Name',style: Styles.textStyle12,)),
                    DataColumn(label: Text('Balance',style: Styles.textStyle12,)),
                  ],
                  rows: chartOfAccounts
                      .map(
                        (account) => DataRow(
                      cells: [
                        DataCell(Text(account.accountNumber,style: Styles.textStyle12,)),
                        DataCell(Text(account.accountName,style: Styles.textStyle12,)),
                        DataCell(Text(account.balance.toStringAsFixed(2),style: Styles.textStyle12, )),
                      ],
                    ),
                  )
                      .toList(),
                ),
              if (chartOfAccounts.isEmpty)
                CircularProgressIndicator(), // Show loading indicator while fetching data
            ],
          ),
        ),
      ),
    );
  }
}
class Account {
  final String accountNumber;
  final String accountName;
  final double balance;

  Account({
    required this.accountNumber,
    required this.accountName,
    required this.balance,
  });
}