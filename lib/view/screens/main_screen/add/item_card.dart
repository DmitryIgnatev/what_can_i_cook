import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/recipe/recipe_page.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('items').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return const Text('Нет записей');

                return GridView.builder(
                  itemCount: (snapshot.data!).docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 4
                          : 2,
                      crossAxisSpacing: 1.w,
                      mainAxisSpacing: 1.h,
                      childAspectRatio: 0.6 //?длина карточки, но есть проблемы с версткой экрана !
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.h),
                        ),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RecipePage(index, pageIndex: index,)),
                                  );
                                  
                                },
                                child: SizedBox(
                                  height: 20.h,
                                  width: 48.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(3.h),
                                      topRight: Radius.circular(3.h),
                                    ),
                                    child: FuturePicture(
                                      fileName: (snapshot.data!)
                                          .docs[index]
                                          .get('pictureUrl'),
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (snapshot.data!).docs[index].get('name'),
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 3.h, color: kPrimaryRedColor),
                                  ),
                                  Text(
                                    (snapshot.data!)
                                        .docs[index]
                                        .get('ingridients'),
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 2.h, color: kTextColor),
                                  ),
                                  Text(
                                    "Время на приготовление:\n${(snapshot.data!).docs[index].get('time')} минут",
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontSize: 2.h, color: kTextColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: kPrimaryRedColor,
                          ),
                          onPressed: () {
                            setState(() {
                              //Delete items
                              FirebaseFirestore.instance
                                  .collection('items')
                                  .doc((snapshot.data!).docs[index].id)
                                  .delete();
                            });
                          },
                        ),
                      )
                    ]);
                  },
                );
              },
            )));
  }
}
