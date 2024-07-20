import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management_application/core/base/base_navigator.dart';
import 'package:task_management_application/core/base/base_view_model.dart';
import 'package:task_management_application/core/services/firestore_service.dart';
import 'package:task_management_application/core/services/firebase_auth_services.dart';

import '../../data/models/user_information_model.dart';

abstract class ChooseTheRegistrationMethodNavigator extends BaseNavigator{}

class ChooseTheRegistrationMethodViewModel extends BaseViewModel<ChooseTheRegistrationMethodNavigator>{
  Future<void>signInWithGoogle(
      {required String messageSuccessTitle, required String messageSuccessContent})async {
    try {
      User user = await FirebaseAuthServices.signInWithGoogle();
      navigator?.showLoading();
      UserInformationModel? userInformationModel = await FirestoreService.getUser(user.email!);
      if(userInformationModel != null){
        navigator?.navigatePushScreenWithNamed("On Boarding...");
        return;
      }
      FirestoreService.createUser(UserInformationModel(email: user.email,fullName: user.displayName,isAccountSocial: true,pathImage: user.photoURL,id: user.uid));
      navigator?.navigatePopFromThisScreen();
      navigator?.displayMessageWithAwesomeDialog(message: messageSuccessContent,title: messageSuccessTitle, dialogType: DialogType.success);
    } on FirebaseAuthException catch (e) {
      navigator?.displayMessageWithAwesomeDialog(message: e.message??e.code, dialogType:DialogType.error,title: "Error");
    }on FirebaseException catch (e){
      navigator?.displayMessageWithAwesomeDialog(message: e.message??e.code, dialogType:DialogType.error,title: "Error");
    }catch(e){
      navigator?.displayMessageWithAwesomeDialog(message: e.toString(), dialogType:DialogType.error,title: "Error");
    }
  }
  Future<void> signOutFromGoogleAccount()async{
    await FirebaseAuthServices.signOutFromGoogleAccount();
    print("signOutFromGoogleAccount");

  }
}
