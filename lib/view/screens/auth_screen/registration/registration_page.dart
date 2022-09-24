import 'package:flutter/material.dart';
import 'package:what_can_i_cook/controller/exit_on_main_button.dart';
import 'package:what_can_i_cook/view/screens/auth_screen/registration/registration_body.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppbar(context, [
        exitOnMainButton(context)
      ]),
      extendBodyBehindAppBar: true,
      body: const RegistrationBody()
    );
  }
}