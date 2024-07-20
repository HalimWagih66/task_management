import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import '../../../../../../core/utils/widget/TextFormField/custom_form_field.dart';
import '../../view_model/sign_up_view_model.dart';

class EmailAndPasswordEntryForm extends StatelessWidget {
   const EmailAndPasswordEntryForm({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = Provider.of<SignUpViewModel>(context,listen: false);
    return Column(
      children: [
        CustomTextFormField(
          hintText: "ex.john@gmail.com",
          textLabel: AppLocalizations.of(context)!.email_address,
          functionValidate: (input) {
            return ValidateInputsFromTextValid.validateEmailValid(context, input);
          },
          borderField: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, style: BorderStyle.solid, width: 2)),
        ),
        const SizedBox(
          height: 50,
        ),
        CustomTextFormField(
          hintText: "**********",
          obscureText: true,
          textLabel: AppLocalizations.of(context)!.password,
          functionValidate: (input) {
            return ValidateInputsFromTextValid.validatePasswordValid(context, input);
          },
          borderField: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, style: BorderStyle.solid, width: 2)),
        ),
      ],
    );
  }
}
