import 'package:firebase/utils/const.dart';
import 'package:flutter/material.dart';

textField(
        {required String hintText,
        required bool isPassword,
        required TextInputType field,
        TextEditingController? controller,
        VoidCallback? onTap,
        Widget? suffixIcon}) =>
    TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: field,
      decoration: InputDecoration(
        
        suffixIcon: suffixIcon,
     
        suffixIconColor: kPrimary,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary, width: 2),
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
