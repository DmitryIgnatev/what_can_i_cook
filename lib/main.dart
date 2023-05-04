import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:what_can_i_cook/view/screens/auth_screen/registration/bloc/registration_bloc.dart';
import 'package:what_can_i_cook/view/screens/splash_screen/splash_screen.dart';

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
      return MultiBlocProvider(
        providers: [
        BlocProvider<RegistrationBloc>(
          create: (context) => RegistrationBloc(),
        ),
      ],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(),
          ),
          home: const SplashScreen(),
        ),
      );
    });
  }
}
