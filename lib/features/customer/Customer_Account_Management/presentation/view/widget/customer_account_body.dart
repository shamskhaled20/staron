import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:staron/constant.dart';
import 'package:staron/features/customer/Customer_Account_Management/data/bloc/bloc.dart';
import 'package:staron/features/customer/Customer_Account_Management/presentation/view/widget/update_customer_account.dart';

import '../../../../../../shared_widgets/Custom_Buttom.dart';
import '../../view_model/customer_account_model.dart';
import 'Custom_data_custom_account.dart';

class CustomerAccountBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Expanded(
        child: BlocBuilder<CustomerAccountCubit, List<CustomerAccountModel>>(
          builder: (context, customerAccounts) {
            // Build your UI based on the customerAccounts data
            return ListView.builder(
              itemCount: customerAccounts.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: KPrimaryColour,
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        CustomDataCustomAccount(
                          title: "Account Number",
                          value: customerAccounts[index].accountNumber,
                        ),
                        CustomDataCustomAccount(
                          title: "Account Name",
                          value: customerAccounts[index].accountName,
                        ),
                        CustomDataCustomAccount(
                          title: "Contact Name",
                          value: customerAccounts[index].contactName,
                        ),
                        CustomDataCustomAccount(
                          title: "Email",
                          value: customerAccounts[index].email,
                        ),
                        CustomDataCustomAccount(
                          title: "Phone",
                          value: customerAccounts[index].phone,
                        ),
                        CustomDataCustomAccount(
                          title: "Address",
                          value: customerAccounts[index].address,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                                            child: UpdateCustomerAccount(),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }),
                              const SizedBox(width: 20,),
                              CustomButtom(IconShape: Icons.close, text: "Delete", Journal_Entry: () {  },)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

