import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/features/choose%20the%20registration%20method%20screen/presentation/view/widgets/screen_the_registration_method_body.dart';
import '../../../../../core/base/base_state.dart';
import '../view model/choose_the_registration_method_view_model.dart';

class ChooseTheRegistrationMethodScreen extends StatefulWidget {
  const ChooseTheRegistrationMethodScreen({super.key});

  static const routeName = "ChooseTheRegistrationMethodScreen";

  @override
  State<ChooseTheRegistrationMethodScreen> createState() => _ChooseTheRegistrationMethodScreenState();
}

class _ChooseTheRegistrationMethodScreenState extends BaseState<ChooseTheRegistrationMethodScreen,ChooseTheRegistrationMethodViewModel> implements ChooseTheRegistrationMethodNavigator{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider(
          create: (context) => viewModel,
          child: const ScreenTheRegistrationMethodBody(),
        )
    );
  }

  @override
  ChooseTheRegistrationMethodViewModel initializeViewModel() {
    return ChooseTheRegistrationMethodViewModel();
  }


  

}
