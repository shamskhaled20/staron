

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staron/features/General_Ledger/Journal_Entry/presentation/view/widget/update_journal_entry.dart';
import 'package:staron/shared_widgets/Custom_Buttom.dart';

import '../../../../../../constant.dart';
import '../../../data/bloc_journal_entry/bloc.dart';
import '../../../data/bloc_journal_entry/bloc_status.dart';
import 'custom_data_journal_entry.dart';

class JournalEntryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JournalEntryCubit, JournalEntryState>(
      builder: (context, state) {
        if (state is JournalEntryLoaded) {
          final journalEntries = state.entries;
          return Expanded(
            child: ListView.builder(
              itemCount: journalEntries.length,
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
                        CustomDatayJournalEntry(title: "date", value:journalEntries[index].date),
                        CustomDatayJournalEntry(title: "description", value:journalEntries[index].description),
                        CustomDatayJournalEntry(title: "debitAmount", value:journalEntries[index].debit.toString()),
                        CustomDatayJournalEntry(title: "creditAmount", value:journalEntries[index].credit.toString()),
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
                                      height: 300, // Adjust the height as needed
                                      child: Text("shams")
                                      //UpdateJournalEntry(),
                                    ); },);
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
            ),
          );
        } else if (state is JournalEntryError) {
          return Text('Error: ${state.error}');
        } else {
          // Handle other states or return a loading indicator
          return CircularProgressIndicator(); // Add your loading indicator widget here
        }
      },
    );

  }
}
