import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class StorageService {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<void> uploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);

    try {
      await storage.ref('pics/$fileName').putFile(file);
    } on firebase_core.FirebaseException {
      //
    }
  }

  Future<String> downloadURL(String imageName) async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      String downloadURL =
          await storage.ref('pics/$imageName').getDownloadURL();
      return downloadURL;
    } catch (e) {
      debugPrint("$e");
    }
    return "";
  }

  Future <String>  pickPictire() async {
    final StorageService storage = StorageService();
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'bmp', 'png'],
    );

    final path = results!.files.single.path!;
    final fileName = results.files.single.name;

    storage.uploadFile(path, fileName);

    return fileName;
  }
}
