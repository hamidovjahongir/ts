import 'package:flutter/material.dart';

class MyButtom extends StatefulWidget {
  final String title;
  final double? borderRadius;
  final Function() value;
  final Color? color;
  final double? width;
  final double? height;
  final Color? textColor;
  final double? fontSize;
  final bool? loading;

  const MyButtom({
    super.key,
    this.loading = false,
    this.borderRadius,
    required this.title,
    required this.value,
    this.color,
    this.width,
    this.height,
    this.textColor,
    this.fontSize,
  });

  @override
  State<MyButtom> createState() => _MyButtomState();
}

class _MyButtomState extends State<MyButtom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(45),
      onTap: widget.value,
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.95,
        height: widget.height ?? 70,
        decoration: BoxDecoration(
          color: widget.color ?? Colors.blue,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 45),
        ),
        child: Center(
          child:
              widget.loading!
                  ? CircularProgressIndicator()
                  : Text(
                    widget.title,
                    style: TextStyle(
                      color: widget.textColor ?? Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: widget.fontSize ?? 14,
                    ),
                  ),
        ),
      ),
    );
  }
}
