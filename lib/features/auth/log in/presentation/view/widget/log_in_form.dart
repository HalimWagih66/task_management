
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/features/auth/log%20in/presentation/view%20model/login_view_model.dart';
import '../../../../../../core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import '../../../../../../core/utils/widget/TextFormField/custom_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    return Column(
      children: [
        CustomTextFormField(functionValidate: (input) {
          return ValidateInputsFromTextValid.validateEmailValid(context, input);
        }, textLabel: AppLocalizations.of(context)!.email,
          hintText: "ex.halemwagih6@gmail.com",
          onSaved: (email) {
            loginViewModel.email = email!;
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomTextFormField(functionValidate: (input) {
          return ValidateInputsFromTextValid.validatePasswordValid(context, input);
        }, textLabel: AppLocalizations.of(context)!.password,
          obscureText: loginViewModel.isHidePassword?true:false,
          suffixIcon: loginViewModel.isHidePassword?Icons.remove_red_eye_outlined:Icons.remove_red_eye,
          onPressedSuffixIcon: (){
          loginViewModel.changeEyePassword();
          },
          onSaved: (password) {
            loginViewModel.password = password!;
          },
          hintText: "******",
        ),
      ],
    );
  }
}


