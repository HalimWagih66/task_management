import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderScreenChooseTheRegistrationMethod extends StatelessWidget {
  const HeaderScreenChooseTheRegistrationMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Image.asset("assets/images/logo_app.png",width: 100,height: 100,),
            Text("Task Management",style: Theme.of(context).textTheme. displaySmall,),
            const SizedBox(height: 20,),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(AppLocalizations.of(context)!.set_up_your_profile,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge),
        ),
      ],
    );
  }
}

