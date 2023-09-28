import 'package:flutter/material.dart';
import 'package:staron/features/Supplier/Supplier_Account_Management/presentation/view/widget/add_supplier_account.dart';
import 'package:staron/features/Supplier/Supplier_nvoice_Management/presentation/view/widget/add_supplier_invoice.dart';
import 'package:staron/features/Supplier/Supplier_nvoice_Management/presentation/view/widget/supplier_invoice_body.dart';
import 'package:staron/features/customer/Customer_Account_Management/presentation/view/widget/add_customer_account.dart';
import 'package:staron/features/customer/Customer_Account_Management/presentation/view/widget/customer_account_body.dart';
import 'package:staron/features/customer/Customer_invoice_Management/presentation/view/widget/add_customer_invoice.dart';
import 'package:staron/features/customer/Customer_invoice_Management/presentation/view/widget/customer_invoice_body.dart';

import '../../../../../shared_widgets/Custom_Buttom.dart';
class SupplierInvoiceView extends StatelessWidget {
  const SupplierInvoiceView({Key? key}) : super(key: key);

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
                            child: AddSupplierInvoice(),
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
            child: SupplierInvoiceBody(),
          ),
        ],
      ),
    );
  }
}
