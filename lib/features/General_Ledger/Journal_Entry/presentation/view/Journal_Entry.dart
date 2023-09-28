import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:staron/core/utits/app_route.dart';
import 'package:staron/features/General_Ledger/Journal_Entry/presentation/view/widget/List_Journal_Entry.dart';
import 'package:staron/features/General_Ledger/Journal_Entry/presentation/view/widget/add_change_Journal_Entry.dart';
import 'package:staron/shared_widgets/Custom_Buttom.dart';
class Journal_Entry extends StatelessWidget {
  const Journal_Entry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: Column(children: [
          Align(
              alignment: Alignment.centerRight,
              child: CustomButtom(IconShape: Icons.add, text: "   Add",
                Journal_Entry: () {
    showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
    return Container(
    height: 300, // Adjust the height as needed
    child: JournalEntryForm(),
    ); },);
              }
              )),
          JournalEntryList()
        ],),
      ),
    );
  }
}
