import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_management_application/core/base/base_navigator.dart';
import 'package:task_management_application/core/base/base_view_model.dart';
abstract class ChooseTheRegistrationMethodNavigator extends BaseNavigator{}

class ChooseTheRegistrationMethodViewModel extends BaseViewModel<ChooseTheRegistrationMethodNavigator>{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> signInWithGoogle()async{
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: [
      'https://www.googleapis.com/auth/drive',
      ],
    ).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    print("name = ${googleUser?.displayName}");
    print("email = ${googleUser?.displayName}");
  }
}