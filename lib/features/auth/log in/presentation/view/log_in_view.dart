import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/core/base/base_state.dart';
import 'package:task_management_application/core/style/colors/application_color.dart';
import 'package:task_management_application/core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import 'package:task_management_application/core/utils/widget/TextFormField/custom_form_field.dart';
import 'package:task_management_application/features/auth/log%20in/presentation/view%20model/login_view_model.dart';
import 'package:task_management_application/features/auth/log%20in/presentation/view/widget/log_in_form.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view/sign_up_view.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view/widget/custom_app_bar.dart';
import '../../../../../core/utils/widget/buttons/custom_elevated_button.dart';
import '../../../../../core/utils/widget/buttons/custom_text_button_use_under_line.dart';
import '../../../sign_up/presentation/view/widget/custom_container_background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../view model/login_navigator.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  static const routeName = "LoginView";

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends BaseState<LogInView, LoginViewModel>
    implements LoginNavigator {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(
            onTap: () {
              navigatePopFromThisScreen();
            }, iconData: Icons.arrow_back_ios, title: "Log In"),
        body: Center(
          child: SingleChildScrollView(
            child: CustomContainerBackground(
              height: MediaQuery.sizeOf(context).height * 0.60,
              child: ChangeNotifierProvider(
                create: (context) => viewModel,
                child: Column(
                  children: [
                    Expanded(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("welcome back to",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            fontSize: 30, color: primaryColor)),
                                const SizedBox(width: 15),
                                Image.asset("assets/images/logo_app.png",
                                    height: 40)
                              ],
                            ),
                            const SizedBox(height: 40),
                            const LoginForm(),
                            const SizedBox(height: 30),
                            CustomTextButtonUseUnderLine(
                              onPressed: () async {
                               await showDialogForChangePassword();
                              },
                              text: AppLocalizations.of(context)!.forget_password,
                            ),
                            CustomTextButtonUseUnderLine(
                              onPressed: () async {
                                pushScreenReplacementWithNamed(
                                    SignUpView.routeName);
                              },
                              text: AppLocalizations.of(context)!
                                  .i_already_have_an_account,
                            )
                          ],
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      text: "Login",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState?.save();
                          await viewModel.login();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  @override
  LoginViewModel initializeViewModel() {
    return LoginViewModel();
  }

  @override
  Future<void> showDialogForChangePassword() async{
    await showDialog(context: context, builder: (context) {
      return DisplayAlertDialogForPassword(loginViewModel: viewModel,);
    },
    );
  }
}
class DisplayAlertDialogForPassword extends StatefulWidget {
   const DisplayAlertDialogForPassword({super.key, required this.loginViewModel});
   final LoginViewModel loginViewModel;
  @override
  State<DisplayAlertDialogForPassword> createState() => _DisplayAlertDialogForPasswordState();
}

class _DisplayAlertDialogForPasswordState extends State<DisplayAlertDialogForPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = "";

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: AlertDialog(
        title: Text("Forget Your Password",style: Theme.of(context).textTheme.titleLarge,),
        content: Form(
          key: formKey,
          child: CustomTextFormField(
            functionValidate: (String? input) {
              return ValidateInputsFromTextValid.validateEmailValid(context, input);},
            hintText: "ex.halemwagih6@gmail.com",
            textLabel: 'Enter the email',
            onSaved: (input) {
              email = input!;
            },
          ),
        ),
        actions: [
          CustomElevatedButton(text: "Send",onPressed: ()async{
            if(formKey.currentState!.validate()){
              formKey.currentState?.save();
              Navigator.pop(context);
              await widget.loginViewModel.resetPassword(email: email);
            }
          },)
        ],
      ),
    );
  }
}
