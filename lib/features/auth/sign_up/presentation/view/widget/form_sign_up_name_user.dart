import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view_model/sign_up_view_model.dart';
import '../../../../../../core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import '../../../../../../core/utils/widget/TextFormField/custom_form_field.dart';

class FormSignUpNameUser extends StatelessWidget {
  const FormSignUpNameUser({super.key, required this.formKey});
   final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = Provider.of<SignUpViewModel>(context,listen: false);
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomTextFormField(
                hintText: "ex: Smith",
                textLabel: AppLocalizations.of(context)!.first_name,
                functionValidate: (input) {
                  return ValidateInputsFromTextValid.validateFirstNameValid(context, input);
                },
                borderField: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue, style: BorderStyle.solid, width: 2)),
              ),
              const SizedBox(height: 50),
              CustomTextFormField(
                hintText: "ex: john",
                textLabel: AppLocalizations.of(context)!.last_name,
                functionValidate: (input) {
                  return ValidateInputsFromTextValid.validateLastNameValid(context, input);
                },
                borderField: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue, style: BorderStyle.solid, width: 2)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
