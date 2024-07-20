
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import '../../../../../../core/utils/widget/TextFormField/custom_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(functionValidate: (input) {
          return ValidateInputsFromTextValid.validateEmailValid(context, input);
        }, textLabel: AppLocalizations.of(context)!.email,
          hintText: "ex.halemwagih6@gmail.com",
        ),
        const SizedBox(
          height: 30,
        ),
        CustomTextFormField(functionValidate: (input) {
          return ValidateInputsFromTextValid.validatePasswordValid(context, input);
        }, textLabel: AppLocalizations.of(context)!.password,
          obscureText: true,
          suffixIcon: Icons.remove_red_eye_outlined,
          onPressedSuffixIcon: (){},
          hintText: "******",
        ),
      ],
    );
  }
}


