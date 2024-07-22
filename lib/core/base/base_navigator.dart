import 'package:awesome_dialog/awesome_dialog.dart';

abstract class BaseNavigator {
  void navigatePushScreenWithNamed(String name);
  void showLoading();
  void navigatePopFromThisScreen();
  Future<void> showDialogForUploadImage();
  void displayMessageWithSnackPar({required String message});
  void displayMessageWithAwesomeDialog({required String message, required DialogType dialogType, String? title, String? posActionName, Function? posAction, bool dismissOnTouchOutside = false, String? nigActionName, Function? nigAction});
  void pushScreenReplacementWithNamed(String routeName);
  void pushScreenAndRemoveUntil(String routeName);
}