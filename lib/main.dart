import 'package:flutter/material.dart';
import 'package:what_can_i_cook/screens/main/main_screen.dart';
import 'package:what_can_i_cook/screens/main/primary_pages/add/add_page.dart';
import 'package:what_can_i_cook/screens/main/favorite/favorite_screen.dart';
import 'package:what_can_i_cook/screens/main/primary_pages/find/find_page.dart';
import 'package:what_can_i_cook/screens/main/new_recipe/new_recipe.dart';
import 'package:what_can_i_cook/screens/settings/settings_page.dart';
import 'package:what_can_i_cook/screens/authorization/authorization_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //!Using sizer for comfortable work with screen sizes :)
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MainScreen(),
          '/list': (context) => const AddPage(),
          '/find': (context) => const FindPage(),
          '/favorite': (context) =>  const FavoritePage(),
          '/settings': (context) => const SettingPage(),
          '/auth': (context) => const AuthorizationPage(),
          '/new_recipe': (context) => const NewRecipe(),
        },
      );
    });
  }
}
