import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view/sign_up_view.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view_model/sign_up_view_model.dart';
import '../widget/custom_icon_navigate_between_pages.dart';
import '../widget/email_and_password_entry_form.dart';

class EmailAndPasswordEntryPart extends StatelessWidget {
  EmailAndPasswordEntryPart({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         Expanded(
           child: Column(
             children: [
               Center(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 7),
                   child: Text(
                     "Enter Your Phone And Your Password",
                     style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                   ),
                 ),
               ),
               EmailAndPasswordEntryForm(formKey: formKey),
             ],
           ),
         ),
         Align(
           alignment: Alignment.bottomCenter,
           child: CustomIconNavigateBetweenPages(
               onPressed: () async{
                await validateForm(context);
               }, iconData: Icons.navigate_next
           ),
         )
       ],
    );
  }

  Future<void> validateForm(BuildContext context) async{
    if(formKey.currentState!.validate()){
      await Provider.of<SignUpViewModel>(context,listen: false).createAccount();
    }
  }
}
