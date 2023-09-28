import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:staron/core/utits/textstyles.dart';
class CustomDataSupplierAccount extends StatelessWidget {
  const CustomDataSupplierAccount({Key? key, required this.title, required this.value}) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 10,top: 10,left: 10),
      child: Table(
        children: [
          TableRow(children: [
            Text(title,),
            Text(value,)
            ,]),
        ],
      ),
    );
  }
}
