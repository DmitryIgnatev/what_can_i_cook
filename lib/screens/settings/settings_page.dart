import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(250, 255, 255, 255),
        foregroundColor: const Color.fromARGB(251, 241, 1, 73),
        title: const Text('Настройки'),
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
      bottomNavigationBar: const Material(
        color: Color.fromARGB(248, 255, 255, 255),
      ),
    );
  }
}