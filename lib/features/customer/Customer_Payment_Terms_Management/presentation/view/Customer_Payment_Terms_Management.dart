import 'package:flutter/material.dart';
import 'package:staron/features/customer/Customer_Account_Management/presentation/view/widget/add_customer_account.dart';
import 'package:staron/features/customer/Customer_Account_Management/presentation/view/widget/customer_account_body.dart';
import 'package:staron/features/customer/Customer_Payment_Terms_Management/presentation/view/widget/add_customer_payment.dart';
import 'package:staron/features/customer/Customer_Payment_Terms_Management/presentation/view/widget/list_customer_payment.dart';

import '../../../../../shared_widgets/Custom_Buttom.dart';

class CustomerPaymenttView extends StatelessWidget {
  const CustomerPaymenttView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CustomButtom(
              IconShape: Icons.add,
              text: "   Add",
              Journal_Entry: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: AddCustomerPayment(),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: CustomerPaymentBody(),
          ),
        ],
      ),
    );
  }
}
