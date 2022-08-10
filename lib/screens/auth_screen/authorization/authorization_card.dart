import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/screens/auth_screen/components/field.dart';
import 'package:what_can_i_cook/screens/auth_screen/components/user_button.dart';
import 'package:what_can_i_cook/screens/auth_screen/registration/registration_page.dart';

class AuthorizationCard extends StatefulWidget {
  const AuthorizationCard({Key? key}) : super(key: key);

  @override
  State<AuthorizationCard> createState() => _AuthorizationCardState();
}

class _AuthorizationCardState extends State<AuthorizationCard> {

  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: SizedBox(
      height: 100.h,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: kPrimaryRedColor,
        ),
        child: Container(
          width: 90.w,
          height: 70.h,
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
                'Авторизация',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(.7),
                ),
              ),
              const SizedBox(),
              field(Icons.account_circle_outlined, 'Имя пользователя', false,false,
              _controllerUserName),
              field(Icons.email_outlined, 'Email...', false, true,
              _controllerEmail),
              field(Icons.lock_outline, 'Пароль...', true, false,
              _controllerPassword),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  userButton(
                    'Войти',
                    2.6,
                    () {
                      HapticFeedback.lightImpact();
                      Fluttertoast.showToast(msg: 'Login button pressed');
                    },
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    width: 40.w,
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Забыли пароль?',
                        style: const TextStyle(color: Colors.blueAccent),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(),
              RichText(
                text: TextSpan(
                  text: 'Создать новый аккаунт',
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationPage()),
                      );
                    },
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    )
    );
  }
}
