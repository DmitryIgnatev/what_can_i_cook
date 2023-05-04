import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/view/widgets/field.dart';
import 'package:what_can_i_cook/services/authorization/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/registration_bloc.dart';

class RegistrationBody extends StatefulWidget {
  const RegistrationBody({Key? key}) : super(key: key);

  @override
  State<RegistrationBody> createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody> {
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Center(
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
              child: BlocBuilder<RegistrationBloc, RegistrationState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Регистрация',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(.7),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(state.checkPassword),
                      field(
                          Icons.email_outlined,
                          'Email...',
                          false,
                          true,
                          (value) => context
                              .read<RegistrationBloc>()
                              .add(EmailChangedEvent(email: value))),
                      SizedBox(
                        height: 20,
                      ),
                      field(
                          Icons.lock_outline,
                          'Пароль...',
                          true,
                          false,
                          (value) => context
                              .read<RegistrationBloc>()
                              .add(PasswordChangedEvent(password: value))),
                      SizedBox(
                        height: 20,
                      ),
                      field(
                          Icons.lock_outline,
                          'Повторите пароль...',
                          true,
                          false,
                          (value) => context.read<RegistrationBloc>().add(
                              CheckPasswordChangedEvent(checkPassword: value))),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () async {
                              HapticFeedback.lightImpact();
                              if (state.checkPassword == state.password) {
                                await Auth().createUserWithEmailAndPassword(
                                    email: state.email,
                                    password: state.password);
                              } else {
                                Fluttertoast.showToast(msg: 'Пароли не совпадают!');
                              }
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
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
