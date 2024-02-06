import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/widgets/field.dart';
import 'package:what_can_i_cook/view/screens/auth_screen/registration/registration_page.dart';

class AuthorizationBody extends StatefulWidget {
  const AuthorizationBody({Key? key}) : super(key: key);

  @override
  State<AuthorizationBody> createState() => _AuthorizationBodyState();
}

class _AuthorizationBodyState extends State<AuthorizationBody> {
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: SizedBox(
      height: height,
      child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.kPrimaryRedColor,
          ),
          child: Container(
            width: 0.90 * width,
            height: 0.70 * height,
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
                field(Icons.account_circle_outlined, 'Имя пользователя', false,
                    false, (value) {},context),
                field(
                    Icons.email_outlined, 'Email...', false, true, (value) {},context),
                field(Icons.lock_outline, 'Пароль...', true, false, (value) {},context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(msg: 'Login button pressed');
                      },
                      child: Container(
                        height: 0.07 * height,
                        width: 0.40 * width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xff4796ff),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Войти',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(width: 0.04 * width),
                    Container(
                      width: 0.40 * width,
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
          )),
    ));
  }
}
