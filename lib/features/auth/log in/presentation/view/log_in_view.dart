import 'package:flutter/material.dart';
import 'package:task_management_application/core/style/colors/application_color.dart';
import 'package:task_management_application/features/auth/log%20in/presentation/view/widget/log_in_form.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view/widget/custom_app_bar.dart';
import '../../../../../core/utils/widget/buttons/custom_elevated_button.dart';
import '../../../../../core/utils/widget/buttons/custom_text_button_use_under_line.dart';
import '../../../sign_up/presentation/view/widget/custom_container_background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogInView extends StatelessWidget {
  LogInView({super.key});
  static const routeName = "LoginView";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBar(onTap: () {

      }, iconData: Icons.arrow_back_ios, title: "Log In"),
      body: Center(
        child: CustomContainerBackground(
          height: MediaQuery.sizeOf(context).height * 0.60,
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
                          Text("welcome back to",style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 30,color: primaryColor)),
                          const SizedBox(width: 15),
                          Image.asset("assets/images/logo_app.png",height: 40)
                        ],
                      ),
                      const SizedBox(height: 40),
                      const LoginForm(),
                      const SizedBox(height: 30),
                      CustomTextButtonUseUnderLine(
                        onPressed: () {  },
                        text: AppLocalizations.of(context)!.forget_password,
                      ),
                      CustomTextButtonUseUnderLine(
                        onPressed: () {  },
                        text: AppLocalizations.of(context)!.i_already_have_an_account,
                      )
                    ],
                  ),
                ),
              ),
             CustomElevatedButton(text: "Login",onPressed: () {
               if(formKey.currentState!.validate()){
                 formKey.currentState?.save();
               }
             },)
            ],
          ),
        ),
      )
    );
  }
}
