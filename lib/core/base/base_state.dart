import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:task_management_application/core/base/base_navigator.dart';
import 'package:task_management_application/core/utils/widget/dialogs/showMessageWithSnackPar.dart';
import '../utils/widget/dialogs/show_dialog_loading.dart';
import '../utils/widget/dialogs/show_dialog_upload_image.dart';
import '../utils/widget/dialogs/show_message_awesome_dialog.dart';
import 'base_view_model.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = initializeViewModel();
    viewModel.navigator = this;
  }

  VM initializeViewModel();

  @override
  void navigatePushScreenWithNamed(String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  void showLoading() async {
    await showDialogLoading(context, barrierDismissible: false);
  }

  @override
  void navigatePopFromThisScreen() {
    Navigator.pop(context);
  }

  @override
  void displayMessageWithAwesomeDialog(
      {required String message,
      required DialogType dialogType,
      String? title,
      String? posActionName,
      Function? posAction,
      bool dismissOnTouchOutside = false,
      String? nigActionName,
      Function? nigAction}) {
    return showMessageWithAwesomeDialog(
        message: message,
        title: title,
        dialogType: dialogType,
        context: context,
      posAction: posAction,
      posActionName: posActionName,
      dismissOnTouchOutside: dismissOnTouchOutside,
      nigAction: nigAction,
      nigActionName: nigActionName
    );
  }

  @override
  Future<void> showDialogForUploadImage() async {
    await showDialogUploadImage(
        context: context,
        onPressedCamera: () async {
          await viewModel.onPressedCamera();
        },
        onPressedGallery: () async {
          await viewModel.onPressedGallery();
        });
  }
  @override
  void displayMessageWithSnackPar({required String message}){
    showMessageWithSnackPar(message: message, context: context);
  }



  @override
  void pushScreenReplacementWithNamed(String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}
