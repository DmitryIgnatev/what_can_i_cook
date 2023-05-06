import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:what_can_i_cook/services/firebase/init_firebase.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';
import 'package:what_can_i_cook/utils/constants.dart';

class FindByNameCard extends StatefulWidget {
  const FindByNameCard({Key? key}) : super(key: key);

  @override
  State<FindByNameCard> createState() => _FindByNameCardState();
}

class _FindByNameCardState extends State<FindByNameCard> {
  final InitFirebase initialise = InitFirebase();

  @override
  void initState() {
    super.initState();

    initialise.initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //*WORKING WITH ELEMENTS in firebase
      stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Нет записей');
        return Column(
          children: <Widget>[
            SizedBox(
              height: 100.h,
              child: ListView.builder(
                itemCount: (snapshot.data!).docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.kPrimaryRedColor),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                            child: SizedBox(
                              width: 30.w,
                              child: FuturePicture(
                                fileName: (snapshot.data!)
                                    .docs[index]
                                    .get('pictureUrl'),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text((snapshot.data!).docs[index].get('name')),
                              Text((snapshot.data!)
                                  .docs[index]
                                  .get('ingridients'))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
