import 'package:flutter/material.dart';
class CustomButtom extends StatelessWidget {
  const CustomButtom({Key? key, required this.IconShape, required this.text, required this.Journal_Entry}) : super(key: key);
 final IconData IconShape;
 final String text;
 final VoidCallback Journal_Entry;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,// Set the width as needed
      height: 30, // Set the height as needed
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,// Border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(10), // Border radius
        color: Colors.green, // Background color
      ),
      child: GestureDetector(
        onTap: Journal_Entry,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 5,left: 5),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16, // Text size
                  ),
                ),
                const SizedBox(width: 5,),
                Icon(IconShape,size: 15,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
