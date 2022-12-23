import 'package:flutter/material.dart';
import 'package:what_can_i_cook/services/storage_service/storage_service.dart';

class FuturePicture extends StatelessWidget {
  final String fileName;
  final Storage storage = Storage();
  FuturePicture({Key? key, required this.fileName}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: storage.downloadURL(fileName),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Image.network(
                  snapshot.data!,
                  fit: BoxFit.cover,
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              
              return Container();
            });
  }
  }
