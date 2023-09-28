import 'package:flutter/material.dart';
import 'package:staron/shared_widgets/Custom_Buttom.dart';

class UpdateJournalEntry extends StatefulWidget {
  @override
  _UpdateJournalEntryState createState() => _UpdateJournalEntryState();
}

class _UpdateJournalEntryState extends State<UpdateJournalEntry> {
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
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10,top: 20),
      child: Column(
        children: [
          Table(
            children: [
              TableRow(
                  children: [
                    Text("Date"),
                    TextField(
                      controller: dateController,
                    ),

                  ]
              ),
              TableRow(
                  children: [
                    Text("description"),
                    TextField(
                      controller: descriptionController,
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    Text("debitAmount"),
                    TextField(
                      controller: debitController,
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    Text("creditAmount"),
                    TextField(
                      controller: creditController,
                    ),
                  ]
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: CustomButtom(IconShape: Icons.done, text: "Submit", Journal_Entry: (){
              _showCustomSnackbar(
                context,
                'Journal entry submitted successfully',
              );
            }),
          )
        ],
      ),
    );
  }
}