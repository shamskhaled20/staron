import 'package:flutter/material.dart';
import 'package:staron/constant.dart';
import 'package:staron/features/customer/Customer_Account_Management/presentation/view/widget/update_customer_account.dart';
import 'package:staron/features/customer/Customer_Payment_Terms_Management/presentation/view/widget/Custom_data_customer_payment.dart';
import 'package:staron/features/customer/Customer_Payment_Terms_Management/presentation/view/widget/update_customer_payment.dart';

import '../../../../../../shared_widgets/Custom_Buttom.dart';
import '../../view_model/customer_payment_model.dart';

class CustomerPaymentBody extends StatefulWidget {
  @override
  _CustomerPaymentBodyState createState() => _CustomerPaymentBodyState();
}

class _CustomerPaymentBodyState extends State<CustomerPaymentBody> {
  List<PaymentTermModel> customerAccounts = [
    PaymentTermModel(
     termName: 'shams',
      dueDays: 2,
      discountPercentage: 10,
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
                    CustomDataCustomPayment(
                      title: "Term Name ",
                      value: customerAccounts[index].termName,
                    ),
                    CustomDataCustomPayment(
                      title: "Days",
                      value: customerAccounts[index].dueDays.toString(),
                    ),
                    CustomDataCustomPayment(
                      title: "Discount",
                      value: customerAccounts[index].discountPercentage.toString(),
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
                                        child: UpdateCustomerPayment(),
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
