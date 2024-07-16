import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../../Log in or create an account screen/presentation/log_in_or_sign_up_view.dart';
import '../../view model/choose_the_registration_method_view_model.dart';
import 'button_continue_account.dart';
import 'custom_horizontal_line.dart';
import 'header_choose_the_registration_method.dart';

class ScreenTheRegistrationMethodBody extends StatelessWidget {
  const ScreenTheRegistrationMethodBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeaderScreenChooseTheRegistrationMethod(),
          const SizedBox(height: 20,),
          Column(
            children: [
              ButtonContinueAccount(
                  onPressed: () async{
                    Provider.of<ChooseTheRegistrationMethodViewModel>(context,listen: false).navigator?.navigateScreenToScreenWithNamed(context, LogInOrSignUpView.routeName);
                  },
                  text: AppLocalizations.of(context)!.continue_with_email,
                  icon: FontAwesomeIcons.envelope,
                background: const Color(0xffef8c30),
                  ),
              const CustomHorizontalLine(),
              ButtonContinueAccount(
                  onPressed: () async {
                    await Provider.of<ChooseTheRegistrationMethodViewModel>(context,listen: false).signInWithGoogle();
                  },
                  icon: FontAwesomeIcons.google,
                  background: const Color(0xff4185ed),
                  text: AppLocalizations.of(context)!.continue_with_gmail
              ),
            ],
          ),
        ],
      ),
    );
  }
}

