
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_management_application/core/base/base_navigator.dart';
import 'package:task_management_application/core/services/firebase_storage_service.dart';

import '../utils/functions/image picker/image_picker_functions.dart';

class BaseViewModel<Nav extends BaseNavigator> extends ChangeNotifier{
  Nav? navigator;
  File? pickedImage;
  Future<void> onPressedCamera() async {
    var tempPickedImage = await ImagePackerFunctions.cameraPicker();
    if (tempPickedImage != null) {
      changePickImage(tempPickedImage);
    }
    navigator?.navigatePopFromThisScreen();
  }

  Future<void> onPressedGallery() async {
    File? tempPickedImage = await ImagePackerFunctions.galleryPicker();
    if (tempPickedImage != null) {
      changePickImage(tempPickedImage);
    }
    navigator?.navigatePopFromThisScreen();
  }
  Future<void>uploadTheImageOnFireStorage()async {
    try {
      await FirebaseStorageService.uploadImageInFirebaseStorage(internalFolderName: FirebaseAuth.instance.currentUser!.email!, imageName: replaceImageName("person"), nameExternalFolder: "Images", file: pickedImage!);
    } on FirebaseException catch (e) {
      navigator?.displayMessageWithSnackPar(e.message??e.code);
    } catch (e){
       navigator?.displayMessageWithSnackPar(e.toString());
    }
  }
  void changePickImage(File pickImage) {
    pickedImage = pickImage;
    notifyListeners();
  }

  String replaceImageName(String imageName) {
    return p.basename(pickedImage!.path).replaceRange(
      0,
      p.basename(pickedImage!.path).lastIndexOf('.'),
      imageName,
    );
  }
}