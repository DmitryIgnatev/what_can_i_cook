import 'package:flutter/material.dart';
import 'package:what_can_i_cook/controller/exit_on_main_button.dart';
import 'package:what_can_i_cook/view/screens/settings/settings_body.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppbar(context, [
        exitOnMainButton(context)
      ]),
      body: const SettingsBody(),
    );
  }
}