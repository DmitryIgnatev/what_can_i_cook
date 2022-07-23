import 'package:flutter/material.dart';
import 'authorization_body.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage>
    with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
              icon: const Icon(Icons.close))
        ],
      ),
      body: const AuthorizationBody(),
    );
  }

}