import 'package:flutter/material.dart';
import 'package:what_can_i_cook/services/storage_service/storage_service.dart';

class FuturePicture extends StatelessWidget {
  final String pictureUrl;
  final StorageService storage = StorageService();
  FuturePicture({Key? key, required this.pictureUrl}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: storage.downloadURL(pictureUrl),
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
