import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/auth_screen/authorization/authorization_page.dart';

Widget customNavigationDrawer(BuildContext context,
    Animation<double> animation1, Animation<double> animation2, bool bool) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return BackdropFilter(
    filter:
        ImageFilter.blur(sigmaY: animation1.value, sigmaX: animation1.value),
    child: Container(
      height: bool ? 0 : height,
      width: bool ? 0 : width,
      color: const Color.fromARGB(0, 255, 255, 255),
      child: Center(
        child: Transform.scale(
          scale: animation2.value,
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).orientation == Orientation.landscape
                  ? 0.50 * width
                  : 0.90 * width,
              height:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 0.50 * height
                      : 0.30 * height,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryRedColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const AuthorizationPage(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 35,
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              radius: 20,
                              child: Icon(
                                Icons.person_outline_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Темный режим',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            Spacer(
                              flex: 9,
                            ),
                            ThemeSwitch(),
                            Spacer(),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          ListTile(
                            tileColor: Colors.black.withOpacity(.08),
                            leading: const CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Icon(
                                Icons.info_outline_rounded,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              HapticFeedback.lightImpact();
                            },
                            title: const Text(
                              'О нас',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            trailing: const Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                            width: MediaQuery.of(context).size.width,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  //late bool isDarkMode;
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    /*
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, child) {
        mode == AdaptiveThemeMode.dark ? isDarkMode = true : isDarkMode = false;
        // update your UI
        return Switch(
          value: isDarkMode,
          onChanged: (value) => setState(() {
            isDarkMode = value;
            if (!isDarkMode) {
              debugPrint("isDarkMod : $isDarkMode");
              AdaptiveTheme.of(context).setLight();
            } else {
              debugPrint("isDarkMod: $isDarkMode");
              AdaptiveTheme.of(context).setDark();
            }
          }),
          inactiveThumbColor: ViRentColors.white,
          activeColor: ViRentColors.orange,
        );
      },
    );
    */
    return Switch(
      value: isDarkMode,
      onChanged: (value) => setState(() {
        isDarkMode = value;
        if (!isDarkMode) {
          debugPrint("isDarkMod : $isDarkMode");
        } else {
          debugPrint("isDarkMod: $isDarkMode");
        }
      }),
      inactiveThumbColor: AppColors.kWhitethemecolor,
      activeColor: AppColors.kTextLigntColor,
    );
  }
}
