import 'package:flutter/material.dart';
import 'package:staron/constant.dart';
import 'package:staron/features/Supplier/Supplier_nvoice_Management/presentation/view/widget/custom_data_supplier_invoice.dart';
import 'package:staron/features/Supplier/Supplier_nvoice_Management/presentation/view/widget/update_supplier_invoice.dart';
import 'package:staron/features/Supplier/Supplier_nvoice_Management/presentation/view_model/supplier_invoice_model.dart';
import 'package:staron/features/customer/Customer_Account_Management/presentation/view/widget/update_customer_account.dart';
import 'package:staron/features/customer/Customer_invoice_Management/presentation/view/widget/Custom_data_Customer_nvoice_Management.dart';

import '../../../../../../shared_widgets/Custom_Buttom.dart';
class SupplierInvoiceBody extends StatefulWidget {
  @override
  _SupplierInvoiceBodyState createState() => _SupplierInvoiceBodyState();
}
class _SupplierInvoiceBodyState extends State<SupplierInvoiceBody> {
  List<SupplierInvoiceModel> customerInvoices = [
    SupplierInvoiceModel(
      invoiceNumber: 'INV-001',
      invoiceDate: '2023-09-15',
      totalAmount: 100.00,
      dueDate: '2023-10-15',
      status: 'Pending',
    ),
    // Add more invoice data here
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Expanded( // Wrap the ListView.builder with Expanded
        child: ListView.builder(
          itemCount: customerInvoices.length,
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
                    CustomDataSupplierInvoice(
                      title: "Invoice Number",
                      value: customerInvoices[index].invoiceNumber,
                    ),
                    CustomDataSupplierInvoice(
                      title: "Invoice Date",
                      value: customerInvoices[index].invoiceDate,
                    ),
                    CustomDataSupplierInvoice(
                      title: "Total Amount",
                      value: customerInvoices[index].totalAmount.toString(),
                    ),
                    CustomDataSupplierInvoice(
                      title: "Due Date",
                      value: customerInvoices[index].dueDate,
                    ),
                    CustomDataSupplierInvoice(
                      title: "Status",
                      value: customerInvoices[index].status,
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
                                        child: UpdateSupplierInvoice(),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },),
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
        ),
      ),
    );
  }
}
