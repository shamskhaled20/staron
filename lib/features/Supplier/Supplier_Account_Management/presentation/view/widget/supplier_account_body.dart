import 'package:flutter/material.dart';
import 'package:staron/constant.dart';
import 'package:staron/features/Supplier/Supplier_Account_Management/presentation/view/widget/Custom_data_supplier_account.dart';
import 'package:staron/features/Supplier/Supplier_Account_Management/presentation/view/widget/updata_supplier_account.dart';
import 'package:staron/features/customer/Customer_Account_Management/presentation/view/widget/update_customer_account.dart';

import '../../../../../../shared_widgets/Custom_Buttom.dart';
import '../../view_model/supplier_account_model.dart';

class SupplierAccountBody extends StatefulWidget {
  @override
  _SupplierAccountBodyState createState() => _SupplierAccountBodyState();
}

class _SupplierAccountBodyState extends State<SupplierAccountBody> {
  List<SupplierAccountModel> customerAccounts = [
    SupplierAccountModel(
      accountNumber: '12345',
      accountName: 'Customer 1',
      contactName: 'John Doe',
      email: 'john@example.com',
      phone: '123-456-7890',
      address: '123 Main St',
    ),
    // Add more customer accounts here
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Expanded( // Wrap the ListView.builder with Expanded
        child: ListView.builder(
          itemCount: customerAccounts.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: KPrimaryColour, // Customize the border color
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    CustomDataSupplierAccount(
                      title: "Account Number",
                      value: customerAccounts[index].accountNumber,
                    ),
                    CustomDataSupplierAccount(
                      title: "Account Name",
                      value: customerAccounts[index].accountName,
                    ),
                    CustomDataSupplierAccount(
                      title: "Contact Name",
                      value: customerAccounts[index].contactName,
                    ),
                    CustomDataSupplierAccount(
                      title: "Email",
                      value: customerAccounts[index].email,
                    ),
                    CustomDataSupplierAccount(
                      title: "Phone",
                      value: customerAccounts[index].phone,
                    ),
                    CustomDataSupplierAccount(
                      title: "Address",
                      value: customerAccounts[index].address,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top :10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButtom(IconShape: Icons.edit, text: "Update", Journal_Entry: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: UpdateSupplierAccount(),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
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
      ),
    );
  }
}
