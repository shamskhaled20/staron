import 'package:flutter/material.dart';
import 'package:staron/features/General_Ledger/Balance_Trial/presentation/view/widget/List_Balance_Trial.dart';
class  BalanceTrialView extends StatelessWidget {
  const  BalanceTrialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTrialBalance()
        ],
      ),
    );
  }
}
