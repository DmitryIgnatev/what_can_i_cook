import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:what_can_i_cook/constants.dart';


class FindPage extends StatefulWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
    
  late String _name;
  late String _ingridients;
  late int _minutes;

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();

    initFirebase();
  }
  ////открытие меню

/////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhitethemecolor,
      body: StreamBuilder(
        //////////////WORKING WITH ELEMENTS in firebase
        stream: FirebaseFirestore.instance.collection('items').snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Нет записей');

//////////ВОТ ТУТ ВЫВОД РЕЦЕПТОВ

          return SafeArea(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: (snapshot.data!).docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    isThreeLine: true,
                    leading: const Icon(
                      Icons.receipt_long,
                      color: Colors.red,
                      size: 40.0,
                    ),
                    title: Text((snapshot.data!)
                        .docs[index]
                        .get('name')), /////выводит только item
                    subtitle:
                        Text((snapshot.data!).docs[index].get('ingridients')),
          
                    ///выводит список ингридиентов
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_sweep,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          ////////////Delete items
                          FirebaseFirestore.instance
                              .collection('items')
                              .doc((snapshot.data!).docs[index].id)
                              .delete();
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      //////////////////Кнопка добавления рецепта
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(253, 0, 209, 146),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Добавить рецепт'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Название рецепта',
                        ),
                        onChanged: (String value) {
                          _name = value;
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'ингридиенты',
                        ),
                        onChanged: (String value) {
                          _ingridients = value;
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'время на приготовление',
                        ),
                        onChanged: (String value) {
                          _minutes = int.parse(value);
                        },
                      )
                    ],
                  ),
                  actions: [
                    ///////Добавление в список
                    ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance.collection('items').add({
                            'name': _name,
                            'ingridients': _ingridients,
                            'time': _minutes
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Добавить ')),

                        ElevatedButton(
                        onPressed: () async {
                          
                          FirebaseFirestore.instance.collection('items').add({

                            'name': _name,
                            'ingridients': _ingridients,
                            'time': _minutes
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Загрузить фото '))
                  ],
                  /////adding ingridients
                );
              });
        },
        child: const Icon(
          Icons.add_box,
        ),
      ),
    );
  }
}