import 'package:flutter/material.dart';
import 'package:staron/constant.dart';
import 'Customer_Account_Management/presentation/view/Customer_Account_Management_view.dart';
import 'Customer_Payment_Terms_Management/presentation/view/Customer_Payment_Terms_Management.dart';
import 'Customer_invoice_Management/presentation/view/Customer_Invoice_Management.dart';


class navigation_in_top_customer extends StatefulWidget {
  const navigation_in_top_customer({Key? key}) : super(key: key);

  @override
  State<navigation_in_top_customer> createState() =>
      _navigation_in_top_customerState();
}

class _navigation_in_top_customerState
    extends State<navigation_in_top_customer>  with TickerProviderStateMixin{
  late TabController _tabController;

  final List<Widget> _tabs = [
    CustomerPaymenttView(),
    CustomerInvoiceView(),
    CustomerAccountView(),
  ];

  final List<String> _tabTitles = [
    'account',
    'Invoice',
    'payment',
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
