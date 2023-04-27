import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/main_screen/add/add_body.dart';
import 'package:what_can_i_cook/services/firebase/init_firebase.dart';
import 'package:what_can_i_cook/view/screens/main_screen/add/add_recipe_button.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final InitFirebase initialise = InitFirebase();

  @override
  void initState() {
    super.initState();

    initialise.initFirebase();
  }

  bool showFab = true;
  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    return Scaffold(
      backgroundColor: AppColors.kWhitethemecolor,
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: showFab ? 1 : 0,
          child: const AddRecipeButton(),
        ),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              showFab = false;
            } else if (direction == ScrollDirection.forward) {
              showFab = true;
            }
          });
          return true;
        },
        child: const AddBody(),
      ),
    );
  }
}
