import 'package:flutter/material.dart';
import 'package:staron/features/General_Ledger/Closing_Periods/presentation/view/widget/update_status_period.dart';

import '../../../../../../constant.dart';
import '../../../../../../shared_widgets/Custom_Buttom.dart';
import 'custom_data_closing_period.dart';

class ListPeriodClosing extends StatefulWidget {
  @override
  _ListPeriodClosingState createState() => _ListPeriodClosingState();
}

class _ListPeriodClosingState extends State<ListPeriodClosing> {
  // Sample accounting period data
  final List<AccountingPeriod> accountingPeriods = [
    AccountingPeriod(
      periodName: 'January 2023',
      status: 'Closed',
    ),
    AccountingPeriod(
      periodName: 'February 2023',
      status: 'In-Progress',
    ),
    // Add more periods here
  ];

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: ListView.builder(
          itemCount: accountingPeriods.length, // Replace with the number of items you have
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: KPrimaryColour
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    CustomDatayClosingPeriods(title: "Period Name", value:accountingPeriods[index].periodName),
                    const SizedBox(width: 40,),
                    CustomDatayClosingPeriods(title: "Status", value:accountingPeriods[index].status),
                    Padding(
                      padding: const EdgeInsets.only(top :10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButtom(IconShape: Icons.edit, text: "Update", Journal_Entry: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 140, // Adjust the height as needed
                                  child: UpdateClosingPeriod(),
                                );
                                },);
                          },),
                          const SizedBox(width: 20,),
                          CustomButtom(IconShape: Icons.close, text: "Delete", Journal_Entry: () {  },)

                        ],),
                    ),
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}

class AccountingPeriod {
  final String periodName;
  final String status;

  AccountingPeriod({
    required this.periodName,
    required this.status,
  });
}