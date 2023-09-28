import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

import '../Chart_of_Accounts_view.dart';

class CircularChart extends StatelessWidget {
  final List<Account> chartOfAccounts;

  CircularChart({required this.chartOfAccounts});

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> sections = chartOfAccounts.map((account) {
      return PieChartSectionData(
        title: account.accountName,
        value: account.balance,
        color: getRandomColor(),
        radius: 60,
        titleStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();

    return Container(
      width: 300,
      height: 300,
      child: PieChart(
        PieChartData(
          sections: sections,
          centerSpaceRadius: 40,
          borderData: FlBorderData(show: false),
          sectionsSpace: 5,
        ),
      ),
    );
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}
