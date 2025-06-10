import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts/core/utils/color.dart';

class MyTextFromFild extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;
  MyTextFromFild({super.key, required this.controller, required this.title, this.validator});

  @override
  State<MyTextFromFild> createState() => _MyTextFromFildState();
}

class _MyTextFromFildState extends State<MyTextFromFild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.title,
        hintStyle: GoogleFonts.gothicA1(
          color: AppColor.textEditControllerColor,
        ),
        
      ),
      validator:widget.validator ,
    );
  }
}
