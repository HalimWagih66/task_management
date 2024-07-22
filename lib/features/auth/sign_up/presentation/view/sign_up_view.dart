import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/core/base/base_state.dart';
import 'package:task_management_application/core/style/colors/application_color.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view/parts_sign_up/email_and_password_entry_part.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view/parts_sign_up/form_sign_up_name_and_image_user.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view/widget/custom_app_bar.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view/widget/custom_container_background.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view_model/sign_up_navigator.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view_model/sign_up_view_model.dart';
import '../../../Log in or sign with email/presentation/view/log_in_or_sign_up_with_email_view.dart';

class SignUpView extends StatefulWidget {
   const SignUpView({super.key});
  static const routeName = "SignUpView";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends BaseState<SignUpView,SignUpViewModel> implements SignUpNavigator{
  final TextEditingController lastNameController= TextEditingController();

  final List<Widget> partsSignUpView = [
    const FormSignUpNameAndImageUser(),
    EmailAndPasswordEntryPart()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBar(
          onTap: () {
            Navigator.pushReplacementNamed(context, LogInOrSignUpWithEmailView.routeName);
          }, iconData: Icons.arrow_back_ios_new, title: 'Sign Up',
        ),
      body: Center(
        child: SingleChildScrollView(
          child: CustomContainerBackground(
            child:  ChangeNotifierProvider(
              create: (context) => viewModel,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.60,
                child: PageView.builder(
                  itemCount: partsSignUpView.length,
                  controller: viewModel.controller,
                  itemBuilder: (context, index) => partsSignUpView[index],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

  @override
  SignUpViewModel initializeViewModel() {
    return SignUpViewModel();
  }
}

