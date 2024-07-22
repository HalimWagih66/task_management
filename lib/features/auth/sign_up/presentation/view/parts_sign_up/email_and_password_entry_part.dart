import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/core/style/colors/application_color.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view_model/sign_up_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widget/email_and_password_entry_form.dart';

class EmailAndPasswordEntryPart extends StatelessWidget {
  EmailAndPasswordEntryPart({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
         children: [
           Expanded(
             child: Column(
               children: [
                 Center(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 7),
                     child: Text(
                       "Enter Your Email And Your Password",
                       style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                     ),
                   ),
                 ),
                 const EmailAndPasswordEntryForm(),
               ],
             ),
           ),
           Align(
             alignment: Alignment.bottomCenter,
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                 onPressed: () async{
                  await validateForm(context);
                 }, child: Text(AppLocalizations.of(context)!.create_account,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
             ),
           )
         ],
      ),
    );
  }

  Future<void> validateForm(BuildContext context) async{
    if(formKey.currentState!.validate()){
      await Provider.of<SignUpViewModel>(context,listen: false).createAccountWithEmailAndPassword();

    }
  }
}
