import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management_application/core/base/base_view_model.dart';

import '../../../../onboarding/view/on_boarding_view.dart';
import 'login_navigator.dart';
class LoginViewModel extends BaseViewModel<LoginNavigator>{
  bool isHidePassword = true;
  late String email,password;
  Future<void> login()async {
    navigator?.showLoading();
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if (userCredential.user?.emailVerified == true) {
        navigator?.navigatePopFromThisScreen();
       navigator?.pushScreenAndRemoveUntil(OnBoardingView.routeName);
      } else {
        navigator?.navigatePopFromThisScreen();
        navigator?.displayMessageWithAwesomeDialog(message: "Please activate the account from your email",title: "Error", dialogType: DialogType.error,nigActionName: "Cancel",nigAction: (){},posActionName: "Send an email again",posAction: ()async{
          await sendEmailVerification();
        });
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if(e.code == "invalid-credential"){
        navigator?.navigatePopFromThisScreen();
        navigator?.displayMessageWithAwesomeDialog(message: "There is an error in the email or password",title: "Error", dialogType: DialogType.error,nigActionName: "Cancel",nigAction: (){});
      }
      else{
        navigator?.navigatePopFromThisScreen();
        navigator?.displayMessageWithSnackPar(message: e.message??e.code);
      }
    } catch(e){
      navigator?.navigatePopFromThisScreen();
      navigator?.displayMessageWithSnackPar(message: e.toString());
    }
  }
  Future <void>sendEmailVerification()async{
    navigator?.showLoading();
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      navigator?.navigatePopFromThisScreen();
      navigator?.displayMessageWithSnackPar(message: "An email has been sent to your email");
    } on FirebaseAuthException catch (e) {
      navigator?.navigatePopFromThisScreen();
      navigator?.displayMessageWithAwesomeDialog(message: e.message??e.code,title: "Error", dialogType: DialogType.error,nigActionName: "Cancel",nigAction: (){});
    } catch (e){
      navigator?.navigatePopFromThisScreen();
      navigator?.displayMessageWithAwesomeDialog(message: e.toString(),title: "Error", dialogType: DialogType.error,nigActionName: "Cancel",nigAction: (){});
    }
  }

  Future<void>resetPassword({required String email})async{
    navigator?.showLoading();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      navigator?.navigatePopFromThisScreen();
      navigator?.displayMessageWithSnackPar(message: "A message has been sent to your account to change the password please go and change the password");
    } on Exception catch (_) {
      navigator?.navigatePopFromThisScreen();
      navigator?.displayMessageWithAwesomeDialog(message: "This email is not valid, modify it",title: "Error",dialogType: DialogType.error,nigActionName: "Cancel",nigAction: (){});
    }
  }
  void changeEyePassword(){
    isHidePassword = !isHidePassword;
    notifyListeners();
  }
}