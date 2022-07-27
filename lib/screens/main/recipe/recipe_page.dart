import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/screens/main/recipe/recipe_body.dart';

class RecipePage extends StatefulWidget {
  final int pageIndex;
  const RecipePage(int i, {Key? key, required this.pageIndex})
      : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
       /*
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: const [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              icon: const Icon(Icons.close))
              
        ],
        
      ),
      */
      backgroundColor: kWhitethemecolor,
      body: RecipeBody(pageIndex:widget.pageIndex),
    );
  }
}
