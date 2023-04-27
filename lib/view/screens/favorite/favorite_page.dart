import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/favorite/favorite_body.dart';
import 'package:what_can_i_cook/view/widgets/main_screen_appbar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryRedColor,
      appBar: mainScreenAppbar(context),
      body: const FavoriteBody()
    );
  }
}
