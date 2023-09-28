import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/bloc_journal_entry/bloc.dart';
import '../../../data/bloc_journal_entry/bloc_status.dart';

class JournalEntryForm extends StatelessWidget {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController debitController = TextEditingController();
  final TextEditingController creditController = TextEditingController();

  // Function to show the custom Snackbar-like message
  void _showCustomSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue,
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JournalEntryCubit, JournalEntryState>(
      builder: (context, state) {
        if (state is JournalEntryCreated) {
          // Optionally, you can react to a state change, e.g., show a success message
          return Text('Journal entry created successfully');
        } else if (state is JournalEntryError) {
          // Handle error state, show an error message
          return Text('Error: ${state.error}');
        } else {
          // If it's not the success or error state, return your form
          return Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
            child: Column(
              children: [
                Table(
                  children: [
                    TableRow(children: [
                      Text("Date"),
                      TextField(
                        controller: dateController,
                      ),
                    ]),
                    TableRow(children: [
                      Text("description"),
                      TextField(
                        controller: descriptionController,
                      ),
                    ]),
                    TableRow(children: [
                      Text("debitAmount"),
                      TextField(
                        controller: debitController,
                      ),
                    ]),
                    TableRow(children: [
                      Text("creditAmount"),
                      TextField(
                        controller: creditController,
                      ),
                    ]),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      final data = {
                        "date": dateController.text,
                        "description": descriptionController.text,
                        "debitAmount": double.parse(debitController.text),
                        "creditAmount": double.parse(creditController.text),
                      };

                      // Use the Cubit's methods to create a journal entry
                      context.read<JournalEntryCubit>().createJournalEntry(data);

                      _showCustomSnackbar(
                        context,
                        'Journal entry submitted successfully',
                      );
                    },
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
