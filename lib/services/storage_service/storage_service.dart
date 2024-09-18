import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class StorageService {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<void> uploadFile(
    String filePath,
    String fileName,
  ) async {
    final File file = File(filePath);

    await storage.ref('pics/$fileName').putFile(file);
  }

  Future<String> downloadURL(String imageName) async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      final String downloadURL =
          await storage.ref('pics/$imageName').getDownloadURL();
      return downloadURL;
    } catch (e) {
      debugPrint('$e');
      throw Exception(e);
    }
  }

  Future<String> pickPictire(BuildContext context) async {
    final StorageService storage = StorageService();
    final results = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'bmp', 'png'],
    );
    if (results == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Вы не выбрали ни одного файла')),
        );
      }

      return 'DefaultPicture.jpg';
    }
    final path = results.files.single.path!;
    final fileName = results.files.single.name;

    await storage.uploadFile(path, fileName);

    return fileName;
  }
}
