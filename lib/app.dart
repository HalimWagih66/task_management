import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'features/Log in or create an account screen/presentation/log_in_or_sign_up_view.dart';
import 'features/choose the registration method screen/presentation/view/choose_the_registration_method_screen.dart';
class TaskManagement extends StatelessWidget {
  const TaskManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ChooseTheRegistrationMethodScreen.routeName: (context)=>const ChooseTheRegistrationMethodScreen(),
        LogInOrSignUpView.routeName: (context)=> const LogInOrSignUpView()
      },
      initialRoute: ChooseTheRegistrationMethodScreen.routeName,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
    );
  }
}
