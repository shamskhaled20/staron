import 'package:flutter/material.dart';

import 'General_Ledger/navigation_top_general_ledger.dart';
import 'Supplier/navigation_in_top_supplier.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int index = 0;
  final pages = [
    navigation_in_top_general_ledger(),
    navigation_in_top_supplier(),
    navigation_in_top_supplier(),
    // navigation_in_lab_inpatient(),
    // results_lab_doctor(),
    // homescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
          child: pages[index]),

      bottomNavigationBar: NavigationBar(
        // set index to make the mark of the bottom being where i click but i but it by default to (home) index number 2
        selectedIndex: index,
        onDestinationSelected: (index) => setState(()=>this.index =index,),
        backgroundColor: Color.fromRGBO(78, 202, 228, 0.24)
        ,
        destinations : [
          NavigationDestination(
            icon: Icon(Icons.monetization_on,
            ),
            label: 'General',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Customer',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Supplier',
          ),
        ],
      ),

    );
  }
}
