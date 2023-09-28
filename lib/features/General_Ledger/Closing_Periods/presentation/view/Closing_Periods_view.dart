import 'package:flutter/material.dart';
import 'package:staron/features/General_Ledger/Closing_Periods/presentation/view/widget/add_closing_period.dart';
import 'package:staron/features/General_Ledger/Closing_Periods/presentation/view/widget/list_closing_periods.dart';

import '../../../../../shared_widgets/Custom_Buttom.dart';
class ClosingPeriodsView extends StatelessWidget {
  const ClosingPeriodsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: CustomButtom(IconShape: Icons.add, text: "   Add",
                  Journal_Entry: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 300, // Adjust the height as needed
                          child: AddClosingPerod(),
                        ); },);
                  }
              )),
          ListPeriodClosing()
        ],
      ),
    );
  }
}
