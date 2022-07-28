import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/screens/user_screen/registration/registration_card.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
              icon: const Icon(Icons.close))
        ],
      ),
      backgroundColor: kPrimaryRedColor,
      extendBodyBehindAppBar: true,
      body: const RegistrationCard()
    );
  }
}