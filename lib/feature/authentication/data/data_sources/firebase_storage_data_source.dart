import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageDataSource {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadProfilePhoto(File photo, User user) async {
    try {
      final storageReference = _firebaseStorage.ref().child('profile_photos/${user.uid}');
      final uploadTask = storageReference.putFile(photo);

      final taskSnapshot = await uploadTask.whenComplete(() => null);

      final downloadURL = await taskSnapshot.ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      log('Error uploading profile photo: $e');
      throw Exception('Failed to upload profile photo');
    }
  }
}