import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/bloc/bloc.dart';

import '../../../../../../shared_widgets/Custom_Buttom.dart';

class AddCustomerAccount extends StatefulWidget {
  @override
  _AddCustomerAccountState createState() => _AddCustomerAccountState();
}

class _AddCustomerAccountState extends State<AddCustomerAccount> {
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
    final customerAccountCubit = BlocProvider.of<CustomerAccountCubit>(context);

    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
      child: Column(
        children: [
          Table(
            children: [
              TableRow(children: [
                Text("Account Number"),
                TextField(
                  controller: accountNumberController,
                ),
              ]),
              TableRow(children: [
                Text("Account Name"),
                TextField(
                  controller: accountNameController,
                ),
              ]),
              TableRow(children: [
                Text("Contact Name"),
                TextField(
                  controller: contactNameController,
                ),
              ]),
              TableRow(children: [
                Text("Email"),
                TextField(
                  controller: emailController,
                ),
              ]),
              TableRow(children: [
                Text("Phone Number"),
                TextField(
                  controller: phoneController,
                ),
              ]),
              TableRow(children: [
                Text("Address"),
                TextField(
                  controller: addressController,
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
                customerAccountCubit.createCustomerAccount({
                  'accountNumber': accountNumberController.text,
                  'accountName': accountNameController.text,
                  'contactName': contactNameController.text,
                  'email': emailController.text,
                  'phone': phoneController.text,
                  'address': addressController.text,
                });
                _showCustomSnackbar(
                  context,
                  'Accounting periods submitted successfully',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

