import 'package:flutter/material.dart';
import 'package:what_can_i_cook/controller/exit_on_main_button.dart';
import 'package:what_can_i_cook/view/screens/auth_screen/authorization/authorization_body.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage>
    with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppbar(context, 
      [
          exitOnMainButton(context)
        ],
        ),
      body: const AuthorizationBody()
    );
  }

}