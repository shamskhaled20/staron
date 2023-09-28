import 'package:flutter/material.dart';
import 'package:staron/constant.dart';
import 'package:staron/features/Supplier/Supplier_Account_Management/presentation/view/supplier_account_view.dart';
import 'package:staron/features/Supplier/Supplier_Payment_Terms_Management/presentation/view/supplier_payment_view.dart';
import 'package:staron/features/Supplier/Supplier_nvoice_Management/presentation/view/Supplier_Invoice_Management_view.dart';

class navigation_in_top_supplier extends StatefulWidget {
  const navigation_in_top_supplier({Key? key}) : super(key: key);

  @override
  State<navigation_in_top_supplier> createState() =>
      _navigation_in_top_supplierState();
}

class _navigation_in_top_supplierState
    extends State<navigation_in_top_supplier>  with TickerProviderStateMixin{
  late TabController _tabController;

  final List<Widget> _tabs = [
    SupplierPaymenttView(),
    SupplierInvoiceView(),
    SupplierAccountView(),
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
