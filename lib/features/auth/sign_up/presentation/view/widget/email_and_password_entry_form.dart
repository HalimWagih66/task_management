import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/utils/functions/validate/validation_email.dart';
import '../../../../../../core/utils/widget/TextFormField/custom_form_field.dart';
import '../../view_model/sign_up_view_model.dart';

class EmailAndPasswordEntryForm extends StatefulWidget {
   const EmailAndPasswordEntryForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<EmailAndPasswordEntryForm> createState() => _EmailAndPasswordEntryFormState();
}

class _EmailAndPasswordEntryFormState extends State<EmailAndPasswordEntryForm> {

  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = Provider.of<SignUpViewModel>(context,listen: false);
    return Form(
      key: widget.formKey,
        child: Column(
          children: [
            CustomFormField(
              hintText: "ex.john@gmail.com",
              textLabel: AppLocalizations.of(context)!.email_address,
              functionValidate: (text) {
                if (text?.isEmpty == true || text?.trim().isEmpty == true) {
                  return AppLocalizations.of(context)!.please_enter_email_address;
                }
                if (!ValidationEmail.isEmail(text!)) {
                  return AppLocalizations.of(context)!.please_enter_the_email_correctly;
                }
                signUpViewModel.userInformationModel.email = text;
                return null;
              },
              borderField: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, style: BorderStyle.solid, width: 2)),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomFormField(
              hintText: "**********",
              obscureText: true,
              textLabel: AppLocalizations.of(context)!.password,
              functionValidate: (text) {
                if (text?.isEmpty == true || text?.trim().isEmpty == true) {
                  return AppLocalizations.of(context)!.please_enter_password;
                }
                else if (text!.length < 6) {
                  return AppLocalizations.of(context)!.please_enter_a_password_that_is_more_than_6_digits;
                }
                signUpViewModel.password = text;
                return null;
              },
              borderField: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, style: BorderStyle.solid, width: 2)),
            ),
          ],
        )
    );
  }
}
