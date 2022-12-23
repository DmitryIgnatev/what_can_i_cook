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
      //
    }

  }
  Future <String> downloadURL(String imageName ) async{
    await Future.delayed(const Duration(seconds: 3));
    try {

      String downloadURL= await storage.ref('pics/$imageName').getDownloadURL();
      return downloadURL;
    } catch (e) {
      if(e == "[firebase_storage/object-not-found] No object exists at the desired reference.)"){
      String downloadURL= await storage.ref('pics/$imageName').getDownloadURL();
      return downloadURL;
      }
    }
    return "";   
  }
}
