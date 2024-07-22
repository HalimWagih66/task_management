import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../../core/style/colors/application_color.dart';
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const routeName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Expanded(child: Image.asset("assets/images/onboarding/onboaring_image.png")),
            Text("Organize your to make a productive day",style: Theme.of(context).textTheme.titleLarge,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text("completing the priority tasks or getting the results that can help you maove the project forwerd",style: Theme.of(context).textTheme.titleMedium?.copyWith(color:Colors.grey,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: AnimatedButton(pressEvent: () {
              },
                color: primaryColor,
              text: "Let's Start",
                buttonTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      )
    );
  }
}
