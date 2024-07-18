import 'package:flutter/material.dart';
import 'package:task_management_application/core/base/base_view_model.dart';
import 'package:task_management_application/features/auth/choose%20the%20registration%20method%20screen/data/models/user_information_model.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view_model/sign_up_navigator.dart';

class SignUpViewModel extends BaseViewModel<SignUpNavigator>{
  PageController? controller = PageController();
  UserInformationModel userInformationModel = UserInformationModel();
}