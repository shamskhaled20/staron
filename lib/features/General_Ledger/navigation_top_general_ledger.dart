import 'package:flutter/material.dart';
import 'package:staron/constant.dart';

import 'Balance_Trial/presentation/view/Balance_Trial_view.dart';
import 'Chart_of_Accounts/presentation/view/Chart_of_Accounts_view.dart';
import 'Closing_Periods/presentation/view/Closing_Periods_view.dart';
import 'Journal_Entry/presentation/view/Journal_Entry.dart';

class navigation_in_top_general_ledger extends StatefulWidget {
  const navigation_in_top_general_ledger({Key? key}) : super(key: key);

  @override
  State<navigation_in_top_general_ledger> createState() =>
      _navigation_in_top_general_ledgerState();
}

class _navigation_in_top_general_ledgerState
    extends State<navigation_in_top_general_ledger>  with TickerProviderStateMixin{
  late TabController _tabController;

  final List<Widget> _tabs = [
    ChartofAccountsView(),
    ClosingPeriodsView(),
    BalanceTrialView(),
    Journal_Entry()
  ];

  final List<String> _tabTitles = [
    'Chart',
    'Closing Period',
    'Balance ',
    'journal'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: KPrimaryColour,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0), // Set the preferred height of the TabBar
          child: TabBar(
            controller: _tabController,
            tabs: _tabTitles.map((title) => Tab(text: title)).toList(),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            labelStyle: TextStyle(fontSize: 12), // Set a smaller font size for the tab labels
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs,
      ),
    );
  }
}

