import 'package:flutter/material.dart';

import '../../../../../../shared_widgets/Custom_Buttom.dart';

class AddCustomerInvoice extends StatefulWidget {
  @override
  _AddCustomerInvoiceState createState() => _AddCustomerInvoiceState();
}

class _AddCustomerInvoiceState extends State<AddCustomerInvoice> {
  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController invoiceDateController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();

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
      padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
      child: Column(
        children: [
          Table(
            children: [
              TableRow(children: [
                Text("Invoice Number"),
                TextField(
                  controller: invoiceNumberController,
                ),
              ]),
              TableRow(children: [
                Text("Invoice Date"),
                TextField(
                  controller: invoiceDateController,
                ),
              ]),
              TableRow(children: [
                Text("Total Amount"),
                TextField(
                  controller: totalAmountController,
                ),
              ]),
              TableRow(children: [
                Text("Due Date"),
                TextField(
                  controller: dueDateController,
                ),
              ]),
              TableRow(children: [
                Text("Status"),
                TextField(
                  controller: statusController,
                ),
              ]),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: CustomButtom(
              IconShape: Icons.done,
              text: "Submit",
              Journal_Entry: () {
                _showCustomSnackbar(
                  context,
                  'Invoice submitted successfully',
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
