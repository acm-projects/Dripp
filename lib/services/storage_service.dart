import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/pages/auth.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(
    String filePath,
  ) async {
    File file = File(filePath);

    try {
      await storage
          .ref('${FirebaseAuth.instance.currentUser?.uid}.png')
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<void> uploadFilePFP(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);

    try {
      await storage.ref('user/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref('test').listAll();

    results.items.forEach((firebase_storage.Reference ref) {
      print('Found File: $ref');
    });

    return results;
  }

  Future<String> downloadUrl(String imageName) async {
    String downloadUrl = await storage.ref('${FirebaseAuth.instance.currentUser?.uid}.png').getDownloadURL();

    return downloadUrl;
  }
}
