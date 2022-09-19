import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
   required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      style: TextStyle(
          fontStyle: FontStyle.normal, fontSize: 20, color: Colors.black54
          //  hintText: hintText,
          ),
          obscureText: false,
          decoration:InputDecoration(
          labelText: labelText,
          hintText: hintText, 
          border: OutlineInputBorder()
          ),

      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      //maxLines: maxLines,
    );
  }
}
