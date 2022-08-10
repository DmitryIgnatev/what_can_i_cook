import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class InitFirebase{

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

}