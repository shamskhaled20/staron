import 'package:flutter/material.dart';
class ListTrialBalance extends StatefulWidget {
  @override
  _ListTrialBalanceState createState() => _ListTrialBalanceState();
}

class _ListTrialBalanceState extends State<ListTrialBalance> {
  // Sample trial balance data
  final List<TrialBalanceEntry> trialBalance = [
    TrialBalanceEntry(
      accountName: 'Account 1',
      debitBalance: 1000.00,
      creditBalance: 500.00,
    ),
    TrialBalanceEntry(
      accountName: 'Account 2',
      debitBalance: 1500.00,
      creditBalance: 1200.00,
    ),
    // Add more entries here
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Account Name')),
              DataColumn(label: Text('Debit Balance')),
              DataColumn(label: Text('Credit Balance')),
            ],
            rows: trialBalance.map((entry) {
              return DataRow(
                cells: [
                  DataCell(Text(entry.accountName)),
                  DataCell(Text(entry.debitBalance.toStringAsFixed(2))),
                  DataCell(Text(entry.creditBalance.toStringAsFixed(2))),
                ],
              );
            }).toList(),
          ),
        ),
    );
  }
}

class TrialBalanceEntry {
  final String accountName;
  final double debitBalance;
  final double creditBalance;

  TrialBalanceEntry({
    required this.accountName,
    required this.debitBalance,
    required this.creditBalance,
  });
}