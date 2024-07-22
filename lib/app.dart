import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_application/features/auth/log%20in/presentation/view/log_in_view.dart';
import 'package:task_management_application/features/onboarding/view/on_boarding_view.dart';
import 'features/auth/Log in or sign with email/presentation/view/log_in_or_sign_up_with_email_view.dart';
import 'features/auth/choose the registration method screen/presentation/view/choose_the_registration_method_screen.dart';
import 'features/auth/sign_up/presentation/view/sign_up_view.dart';
class TaskManagement extends StatelessWidget {
  const TaskManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ChooseTheRegistrationMethodScreen.routeName: (context)=>const ChooseTheRegistrationMethodScreen(),
        LogInOrSignUpWithEmailView.routeName: (context)=> const LogInOrSignUpWithEmailView(),
        SignUpView.routeName:(context) => const SignUpView(),
        LogInView.routeName:(context) =>  const LogInView(),
        OnBoardingView.routeName:(context) => const OnBoardingView()
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
