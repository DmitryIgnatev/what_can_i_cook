import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/screens/user_screen/components/field.dart';
import 'package:what_can_i_cook/screens/user_screen/components/user_button.dart';

class RegistrationCard extends StatefulWidget {
  const RegistrationCard({Key? key}) : super(key: key);

  @override
  State<RegistrationCard> createState() => _RegistrationCardState();
}

class _RegistrationCardState extends State<RegistrationCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 100.h,
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: kBlueColor,
          ),
          child: Container(
            width: 90.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 90,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                Text(
                  'Регистрация',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(.7),
                  ),
                ),
                const SizedBox(),
                field(Icons.account_circle_outlined, 'Имя пользователя', false,
                    false),
                field(Icons.email_outlined, 'Email...', false, true),
                field(Icons.lock_outline, 'Пароль...', true, false),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    userButton(
                      'Продолжить',
                      2.6,
                      () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(msg: 'Login button pressed');
                      },
                    ),
                    SizedBox(width: 4.w),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
