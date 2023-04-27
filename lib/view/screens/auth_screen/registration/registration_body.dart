import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/widgets/field.dart';
import 'package:what_can_i_cook/services/authorization/auth.dart';

class RegistrationBody extends StatefulWidget {
  const RegistrationBody({Key? key}) : super(key: key);

  @override
  State<RegistrationBody> createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody> {
  String errorMessage = '';
  bool isLogin = true;
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> hereCreateUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
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
                color: AppColors.kBlueColor,
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
                      'Регистрация',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                    const SizedBox(),
                    field(Icons.account_circle_outlined, 'Имя пользователя',
                        false, false, _controllerUserName),
                    field(Icons.email_outlined, 'Email...', false, true,
                        _controllerEmail),
                    field(Icons.lock_outline, 'Пароль...', true, false,
                        _controllerPassword),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            hereCreateUserWithEmailAndPassword();
                            Fluttertoast.showToast(msg: 'button pressed');
                          },
                          child: Container(
                            height: 7.h,
                            width: 40.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff4796ff),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Продолжить',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
