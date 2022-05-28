import 'package:firebase/utils/const.dart';
import 'package:flutter/material.dart';

import '../utils/textstyle.dart';

buttons({
  required String text,
  required double height,
  required double width,
  required VoidCallback onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: width,
        height: height,
        child: Text(
          text,
          style: buttonText,
        ),
      ),
    );
