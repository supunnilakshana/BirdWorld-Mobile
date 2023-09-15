import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';

class CloudStorageServices {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> uploadImage(
      Uint8List data, String collection, String userID) async {
    final String imagename = DateTime.now().toIso8601String();
    String downloadedData = "";
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('public/$userID/$collection/$imagename.png');

    try {
      await ref.putData(data);
      print("uploaded");

      downloadedData = await ref.getDownloadURL();

      print(downloadedData);
    } on Exception catch (e) {
      print(e.toString());
    }
    return downloadedData;
  }

  Future<String> uploadImageWithname(Uint8List data, String collection,
      String userID, String imagename) async {
    String downloadedData = "";
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('public/$userID/$collection/$imagename.png');

    try {
      await ref.putData(data);
      print("uploaded");

      downloadedData = await ref.getDownloadURL();

      print(downloadedData);
    } on Exception catch (e) {
      print(e.toString());
    }
    return downloadedData;
  }

  Future<String> uploadFile(
    File data,
    String collection,
    String userID,
  ) async {
    String downloadedData = "";
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('public/$userID/$collection');

    try {
      await ref.putFile(
        data,
      );
      print("uploaded");

      downloadedData = await ref.getDownloadURL();

      print(downloadedData);
    } on Exception catch (e) {
      print(e.toString());
    }
    return downloadedData;
  }

  Future<int> deletefile(String collection, String imgename) async {
    int a = 0;
    try {
      await storage.ref('$collection/$imgename.png').delete();
    } on Exception catch (e) {
      print(e.toString());
    }
    a = 1;
    return a;
  }
}
