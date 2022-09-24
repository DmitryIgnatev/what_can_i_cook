import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/controller/exit_on_main_button.dart';
import 'package:what_can_i_cook/view/screens/favorite/favorite_body.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryRedColor,
      appBar: transparentAppbar(context, [
        exitOnMainButton(context)
      ]),
      body: const FavoriteBody()
    );
  }
}
