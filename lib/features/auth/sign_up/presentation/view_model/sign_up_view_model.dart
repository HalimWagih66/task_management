import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_management_application/core/base/base_view_model.dart';
import 'package:task_management_application/features/auth/choose%20the%20registration%20method%20screen/data/models/user_information_model.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view_model/sign_up_navigator.dart';

class SignUpViewModel extends BaseViewModel<SignUpNavigator>{
  PageController controller = PageController();
  UserInformationModel userInformationModel = UserInformationModel();
  String? password;
  void nextPageViewBuilder(){
    controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }
  Future<void> createAccount() async {
    navigator?.showLoading();
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userInformationModel.email!, password: password!);
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      navigator?.navigatePopFromThisScreen();
      navigator?.displayMessageWithAwesomeDialog(message: "An email has been sent to your email address to create an account",title: "Success", dialogType: DialogType.success);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        navigator?.navigatePopFromThisScreen();
        navigator?.displayMessageWithSnackPar("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        navigator?.navigatePopFromThisScreen();
        navigator?.displayMessageWithSnackPar( "The account already exists for that email.");
      }
    } catch (e) {
      navigator?.navigatePopFromThisScreen();
      navigator?.displayMessageWithSnackPar(e.toString());
    }
  }
}