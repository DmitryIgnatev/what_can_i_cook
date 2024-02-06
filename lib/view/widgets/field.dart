import 'package:flutter/material.dart';

Widget field(
      IconData icon, String hintText, bool isPassword, bool isEmail, void Function(String)? onChanged, BuildContext context) {
        final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
    return Container(
      height: 0.07*height,
      width: 82* width,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 0.03*width),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
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
        onChanged: onChanged,
      ),
      
    );
  }