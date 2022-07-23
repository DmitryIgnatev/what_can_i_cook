import 'package:flutter/material.dart';
import 'package:what_can_i_cook/constants.dart';
import 'package:what_can_i_cook/screens/main/recipe/photo_and_rating.dart';

class RecipeBody extends StatelessWidget {
  const RecipeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const PhotoAndRating(),
        Padding(
          padding: const EdgeInsets.all(kDefaultPaddin),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: const <Widget>[],
              )),
              SizedBox(
                height: 64,
                width: 64,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: kPrimaryColor))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kPrimaryColor),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 28,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
