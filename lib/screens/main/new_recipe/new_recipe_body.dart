import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';
import 'package:what_can_i_cook/services/storage_service/storage_service.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: 
      
      GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        children: [
          
          FuturePicture(fileName: _fileName),
          Column(
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
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('items').add({
                      'name': _name,
                      'ingridients': _ingridients,
                      'time': _minutes,
                      'pictureUrl': _fileName
                    });
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: const Text('Добавить ')),
                   ElevatedButton(
                onPressed: () async {
                  final results = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'jpeg', 'bmp', 'png'],
                  );

                  if (results == null) {
                    /*
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Вы не выбрали ни одного файла")));
                        */
                    return;
                  }

                  final path = results.files.single.path!;
                  final fileName = results.files.single.name;
                  _fileName = fileName;
                  storage.uploadFile(path, fileName);
                },
                child: const Text("Загрузить файл")),
          
            ],
          ),
        ],
      ),
    );
  }
}
