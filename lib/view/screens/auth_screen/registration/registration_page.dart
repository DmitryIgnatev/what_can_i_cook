import 'package:flutter/material.dart';
import 'package:what_can_i_cook/view/screens/auth_screen/registration/registration_body.dart';
import 'package:what_can_i_cook/view/widgets/main_screen_appbar.dart';

import '../../../../utils/constants.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBlueColor,
        appBar: mainScreenAppbar(context),
        extendBodyBehindAppBar: true,
        body: const RegistrationBody());
  }
}
