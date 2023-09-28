import 'package:flutter/material.dart';
import 'package:staron/features/customer/Customer_Account_Management/presentation/view/widget/add_customer_account.dart';
import 'package:staron/features/customer/Customer_Account_Management/presentation/view/widget/customer_account_body.dart';

import '../../../../../shared_widgets/Custom_Buttom.dart';
import '../view_model/customer_account_model.dart';

class CustomerAccountView extends StatelessWidget {
  const CustomerAccountView({Key? key}) : super(key: key);

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
                            child: AddCustomerAccount(),
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
            child: CustomerAccountBody(),
          ),
        ],
      ),
    );
  }
}
