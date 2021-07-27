import 'package:flutter/material.dart';

import 'package:portfolio_app/utils.dart';


// ignore: must_be_immutable
class CustomDivider extends StatelessWidget {
  final String text;
  double? fontSize;
  Color? color;

  CustomDivider({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey,
          thickness: 2.0,
          indent: 70.w,
          endIndent: 70.w,
        ),
        Center(
          child: Text(
            this.text,
            style: TextStyle(
              fontFamily: "Quicksand",
              fontSize: this.fontSize ?? 25.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
              color: this.color
            ),
          )
        ),
        Divider(
          color: Colors.grey,
          thickness: 2.0,
          indent: 70.w,
          endIndent: 70.w,
        )
      ],
    );
    
  }
}