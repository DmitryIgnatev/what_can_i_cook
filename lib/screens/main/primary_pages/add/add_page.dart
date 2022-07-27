import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/screens/main/primary_pages/add/action_button.dart';
import 'package:what_can_i_cook/screens/main/primary_pages/add/add_body.dart';
import 'package:firebase_core/firebase_core.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();

    initFirebase();
  }
  @override
  Widget build(BuildContext context)  {
    return const Scaffold(
      backgroundColor: kWhitethemecolor,
      body: AddBody(),
      floatingActionButton: ActionButton(),
    );
  }
}