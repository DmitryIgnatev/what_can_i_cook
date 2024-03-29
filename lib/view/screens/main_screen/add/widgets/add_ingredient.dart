import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:what_can_i_cook/utils/constants.dart';

import '../../../../../models/ingredient.dart';
import '../../../../../services/firebase/firestore.dart';

class AddIngredient extends StatefulWidget {
  const AddIngredient({
    super.key,
  });

  @override
  State<AddIngredient> createState() => _AddIngredientState();
}

class _AddIngredientState extends State<AddIngredient> {
  bool preloader = true;
  String _ingredient = "";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 0.90 * width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        //color: Theme.of(context).primaryIconTheme.color,
                        color: AppColors.kTextColor,
                      ),
                      splashRadius: 0.5,
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 0, 36, 26),
                  child: Text(
                    "Добавить",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: AppColors.kTextColor),
                  ),
                ),
                SizedBox(
                  height: 90,
                  width: 0.80 * width,
                  child: StreamBuilder<List<Ingredient>>(
                    stream: ReadStore()
                        .readData('ingredients', Ingredient.fromJson),
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                            child: Text(
                          'Функция недоступна',
                        ));
                      } else {
                        return TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: Theme.of(context).cardColor,
                            filled: true,
                            hintText: 'Добавить новый ингредиент в базу данных',
                            hintStyle: const TextStyle(
                                color: AppColors.kTextLigntColor, fontSize: 16),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              _ingredient = value;
                            });
                          },
                        );
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: preloader
                      ? () {
                          FireStore().createIngredient(_ingredient);
                          setState(() {
                            preloader = false;
                          });
                          Navigator.pop(context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(0.70 * width, 100),
                    minimumSize: Size(0.70 * width, 50),
                    elevation: 0,
                    backgroundColor: AppColors.kPrimaryRedColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: preloader
                      ? Text(
                          textAlign: TextAlign.center,
                          "ОК",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        )
                      : const CircularProgressIndicator(),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
