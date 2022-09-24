import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/controller/field.dart';
import 'package:what_can_i_cook/controller/user_button.dart';
import 'package:what_can_i_cook/view/screens/auth_screen/registration/registration_page.dart';
import 'package:what_can_i_cook/services/authorization/auth.dart';
import 'package:what_can_i_cook/view/widgets/big_info_card.dart';

class AuthorizationBody extends StatefulWidget {
  const AuthorizationBody({Key? key}) : super(key: key);

  @override
  State<AuthorizationBody> createState() => _AuthorizationBodyState();
}

class _AuthorizationBodyState extends State<AuthorizationBody> {
  String errorMessage = '';

  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> hereSignInWithEmailPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

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
          child: bigInfoCard(
            context,
            [
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
              field(Icons.account_circle_outlined, 'Имя пользователя', false,
                  false, _controllerUserName),
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
          )
          ),
    ));
  }
}
