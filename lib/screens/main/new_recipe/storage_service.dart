import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<void> uploadFile(
    String filePath,
    String fileName,
  ) async {
 
    File file = File(filePath);

    try {
      await storage.ref('pics/$fileName').putFile(file);
    } 
    
    on firebase_core.FirebaseException {
      //print(e);
    }
    
    /*
    on firebase_core.FirebaseException catch (e) {
      print(e);
    }
    */

  }
/*
  Future<firebase_storage.ListResult> listFiles() async{
    firebase_storage.ListResult results = await storage.ref('pics').listAll();

    
    results.items.forEach((firebase_storage.Reference ref) {
       print('Найден файл: $ref');
       });

       return results;
  }
*/
  Future <String> downloadURL(String imageName ) async{

    String downloadURL= await storage.ref('pics/$imageName').getDownloadURL();

    return downloadURL;
  }
}
