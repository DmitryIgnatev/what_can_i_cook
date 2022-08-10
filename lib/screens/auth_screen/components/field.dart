import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget field(
      IconData icon, String hintText, bool isPassword, bool isEmail, TextEditingController controller) {
    return Container(
      height: 7.h,
      width: 82.w,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 3.w),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
        ),
      ),
    );
  }