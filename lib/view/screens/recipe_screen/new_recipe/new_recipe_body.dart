import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/models/tag.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';
import 'package:what_can_i_cook/services/storage_service/storage_service.dart';

import '../../../../models/ingredient.dart';
import '../../main_screen/add/widgets/add_ingredient.dart';

class NewRecipeBody extends StatefulWidget {
  const NewRecipeBody({Key? key}) : super(key: key);

  @override
  State<NewRecipeBody> createState() => _NewRecipeBodyState();
}

class _NewRecipeBodyState extends State<NewRecipeBody> {
  List<Ingredient> _filteredItems = [];
  String _name = "";
  List<String> _ingredients = [];
  int _minutes = 0;
  String _fileName = 'DefaultPicture.jpg';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          newPhotoAndTitle(FuturePicture(fileName: _fileName)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    final filteredItem = _filteredItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _ingredients.add(filteredItem.ingredient);
                          });
                        },
                        child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                border: Border.all(
                                    color: AppColors.kPrimaryRedColor)),
                            child: Center(
                                child: Text(
                              filteredItem.ingredient,
                              style: TextStyle(
                                  color: AppColors.kPrimaryRedColor,
                                  fontWeight: FontWeight.bold),
                            ))),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AddIngredient(),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: AppColors.kBlueColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          )),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: StreamBuilder<List<Ingredient>>(
                      stream: ReadStore().readIngredients(),
                      builder: (BuildContext context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: Text(
                            'Функция недоступна',
                          ));
                        } else {
                          final items = snapshot.data!;
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
                              hintText: 'Ингридиенты',
                              hintStyle: const TextStyle(
                                  color: AppColors.kTextLigntColor,
                                  fontSize: 16),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _filteredItems = items
                                    .where((item) => item.ingredient
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              });
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: _ingredients.isEmpty ? 0 : 100,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                      itemCount: _ingredients.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, childAspectRatio: 2),
                      itemBuilder: (context, index) {
                        final item = _ingredients[index];
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(item),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          //ingredientsList.remove(item);
                                          _ingredients.remove(item);
                                        });
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
                  )),
              const SizedBox(height: 10),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: TextFormField(
                  maxLines: 10,
                  cursorColor: AppColors.kPrimaryRedColor,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    fillColor: Theme.of(context).cardColor,
                    filled: true,
                    hintText: 'Опишите развернуто свой рецепт',
                    hintStyle: const TextStyle(
                        color: AppColors.kTextLigntColor, fontSize: 16),
                  ),
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.w500,
                    color: AppColors.kTextColor,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget newPhotoAndTitle(photo) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Error');
          return SizedBox(
            height: 40.h,
            child: Stack(children: <Widget>[
              SizedBox(
                  width: 100.h,
                  height: 40.h - 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.h),
                      ),
                      child: photo)),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 95.h
                        : 95.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.h),
                          topLeft: Radius.circular(5.h)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  fillColor: Theme.of(context).cardColor,
                                  filled: true,
                                  hintText: 'Название рецепта',
                                  hintStyle: const TextStyle(
                                      color: AppColors.kTextLigntColor,
                                      fontSize: 20),
                                ),
                                onChanged: (String value) {
                                  _name = value;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  fillColor: Theme.of(context).cardColor,
                                  filled: true,
                                  hintText: 'Время на приготовление',
                                  hintStyle: const TextStyle(
                                      color: AppColors.kTextLigntColor,
                                      fontSize: 12),
                                ),
                                onChanged: (String value) {
                                  _minutes = int.parse(value);
                                },
                              ),
                            ),
                            StreamBuilder<List<Tag>>(
                              stream: ReadStore().readTags(),
                              builder: (BuildContext context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                      child: Text(
                                    'Нет записей',
                                  ));
                                } else {
                                  final tags = snapshot.data!;
                                  return SizedBox(
                                    height: 20,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: tags.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 8, 0),
                                            child: Text("${tags[index].tag}"),
                                          );
                                        }),
                                  );
                                }
                              },
                            ),
                          ],
                        )),
                        //*edit button
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: ElevatedButton(
                              onPressed: () async {
                                _fileName =
                                    await StorageService().pickPictire(context);
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color:
                                                AppColors.kPrimaryRedColor))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.kPrimaryRedColor),
                              ),
                              child: const Icon(
                                Icons.photo_camera,
                                size: 28,
                                color: Colors.white,
                              )),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: ElevatedButton(
                              onPressed: () {
                                FireStore().createRecipe(_name, _ingredients,
                                    _minutes, _fileName, description);
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color:
                                                AppColors.kPrimaryRedColor))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.kPrimaryRedColor),
                              ),
                              child: const Icon(
                                Icons.check,
                                size: 28,
                                color: Colors.white,
                              )),
                        ),
                        //*edit button end
                        const SizedBox(width: 5),
                      ],
                    ),
                  ))
            ]),
          );
        });
  }
}
