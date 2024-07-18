import 'package:flutter/material.dart';
import 'package:task_management_application/features/Log%20in%20or%20create%20an%20account%20screen/presentation/view/widget/custom_animated_button.dart';
import 'package:task_management_application/features/choose%20the%20registration%20method%20screen/presentation/view/choose_the_registration_method_screen.dart';
import '../../../../core/utils/style/colors/application_color.dart';
import '../../../../core/utils/widget/app_bar/custom_leading_item.dart';
class LogInOrSignUpWithEmailView extends StatelessWidget {
  const LogInOrSignUpWithEmailView({super.key});

  static String routeName = "ContinueAccountWithEmailView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeadingItem(
          colorIcon: primaryColor,
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, ChooseTheRegistrationMethodScreen.routeName
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                "assets/images/onboarding/onboaring_image.png"),
            Text("Task Management",
                style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 10),
            Text(
                "Time is The scarcest resource and unless it is managed nothing else can be managed",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey)),
            const SizedBox(height: 20),
            CustomAnimatedButton(
              pressEven: () {
                //Navigator.pushNamed(context, "LoginView.routeName");
              },textButton: "Login",
            ),
            const SizedBox(height: 10),
            CustomAnimatedButton(pressEven: () {
              //Navigator.pushNamed(context, "SignUpView.routeName");
            },textButton: "Sign Up",),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          ],
        ),
      ),
    );
  }
}

