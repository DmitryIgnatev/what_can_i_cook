import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:what_can_i_cook/services/firebase/init_firebase.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';

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
        stream: FirebaseFirestore.instance.collection('items').snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Нет записей');

          return Column(
            children: <Widget>[
              Container(
                height: 50.h,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: (snapshot.data!).docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        isThreeLine: true,
                        leading: Container(
                          width: 20.w,
                          child: FuturePicture(fileName: (snapshot.data!)
                                          .docs[index]
                                          .get('pictureUrl'),
                          ),
                        ),
                        title: Text((snapshot.data!)
                            .docs[index]
                            .get('name')),
                        subtitle:
                            Text((snapshot.data!).docs[index].get('ingridients')),

                      
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