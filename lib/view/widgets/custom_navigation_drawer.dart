import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/view/widgets/my_tile.dart';

Widget customNavigationDrawer(BuildContext context,Animation<double> animation1,Animation<double> animation2,bool bool) {
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaY: animation1.value, sigmaX: animation1.value),
      child: Container(
        height: bool ? 0 : MediaQuery.of(context).orientation == Orientation.landscape ? 100.w : 100.h,
        width: bool ? 0 : MediaQuery.of(context).orientation == Orientation.landscape ? 100.h : 100.w,
        color: const Color.fromARGB(0, 255, 255, 255),
        child: Center(
          child: Transform.scale(
            scale: animation2.value,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).orientation == Orientation.landscape ? 50.h : 90.w,
                height: MediaQuery.of(context).orientation == Orientation.landscape ? 50.w : 30.h,
                decoration: BoxDecoration(
                  color: kPrimaryRedColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/auth");
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 35,
                        child: Icon(
                          Icons.person_outline_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        myTile(context,Icons.settings_outlined, 'Настройки', () {
                          HapticFeedback.lightImpact();
                          Navigator.pushReplacementNamed(context, "/settings");
                        }),
                        myTile(context,Icons.info_outline_rounded, 'О нас', () {
                          HapticFeedback.lightImpact();
                        }),
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }