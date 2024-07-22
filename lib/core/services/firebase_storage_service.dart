
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
class FirebaseStorageService{
  static Future<String> uploadImageInFirebaseStorage({required String internalFolderName,
    required String imageName,
    required String nameExternalFolder,
    required File file}) async {
    String urlImage;
    print("uploadImage");
    FirebaseStorage firebaseStorage = FirebaseStorage.instanceFor(bucket: "gs://task-management-952ef.appspot.com");
    Reference reference = firebaseStorage.ref("$nameExternalFolder/$internalFolderName").child(imageName);
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    urlImage = await taskSnapshot.ref.getDownloadURL();
    print("urlDownloader = $urlImage");
    return urlImage;
  }
}