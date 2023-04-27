import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';
import 'package:what_can_i_cook/services/storage_service/storage_service.dart';
import 'package:what_can_i_cook/view/screens/main_screen/main_screen.dart';

class NewRecipeBody extends StatefulWidget {
  const NewRecipeBody({Key? key}) : super(key: key);

  @override
  State<NewRecipeBody> createState() => _NewRecipeBodyState();
}

class _NewRecipeBodyState extends State<NewRecipeBody> {
  late String _name;
  late String _ingridients;
  late int _minutes;
  late String _fileName = 'DefaultPicture.jpg';

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //?leading button created automatically?
          backgroundColor: Colors.transparent,
          elevation: 0,
          pinned: true,
          expandedHeight: 40.h,
          flexibleSpace: FlexibleSpaceBar(
              background: newPhotoAndTitle(
                  storage, FuturePicture(fileName: _fileName))),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100.h,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  TextField(
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
                      hintText: 'Ингридиенты',
                      hintStyle:
                          const TextStyle(color: AppColors.kTextLigntColor, fontSize: 16),
                    ),
                    onChanged: (String value) {
                      _ingridients = value;
                    },
                  ),
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
                        hintText: 'Опишите развернуто свой рецепт',
                        hintStyle: const TextStyle(
                            color: AppColors.kTextLigntColor, fontSize: 16),
                      ),
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.w500,
                        color: AppColors.kWhitethemecolor,
                      ),
                    ),
                  ),
                ]),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }

  Widget newPhotoAndTitle(storage, photo) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Error');
          return SizedBox(
            child: Stack(children: <Widget>[
              SizedBox(
                  width: 100.h,
                  height: 40.h,
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
                                      color: AppColors.kTextLigntColor, fontSize: 20),
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
                                      color: AppColors.kTextLigntColor, fontSize: 12),
                                ),
                                onChanged: (String value) {
                                  _minutes = int.parse(value);
                                },
                              ),
                            ),
                          ],
                        )),
                        //*edit button
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: ElevatedButton(
                              onPressed: () async {
                                final results =
                                    await FilePicker.platform.pickFiles(
                                  allowMultiple: false,
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    'jpg',
                                    'jpeg',
                                    'bmp',
                                    'png'
                                  ],
                                );

                                if (results == null) {
                                  if (!mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Вы не выбрали ни одного файла")));

                                  return;
                                }

                                final path = results.files.single.path!;
                                final fileName = results.files.single.name;
                                _fileName = fileName;
                                setState(() {
                                  storage.uploadFile(path, fileName);
                                });
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: AppColors.kPrimaryRedColor))),
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
                                FirebaseFirestore.instance
                                    .collection('items')
                                    .add({
                                  'name': _name,
                                  'ingridients': _ingridients,
                                  'time': _minutes,
                                  'pictureUrl': _fileName
                                });
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const MainScreen()),
                                );
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: AppColors.kPrimaryRedColor))),
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
                        const SizedBox(width: 5)
                      ],
                    ),
                  ))
            ]),
          );
        });
  }
}
