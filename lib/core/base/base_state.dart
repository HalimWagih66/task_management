import 'package:flutter/material.dart';
import 'package:task_management_application/core/base/base_navigator.dart';
import 'base_view_model.dart';

abstract class BaseState<T extends StatefulWidget , VM extends BaseViewModel> extends State<T> implements BaseNavigator{
  late VM viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = initializeViewModel();
    viewModel.navigator = this;
  }
  VM initializeViewModel();

  @override
  void navigateScreenToScreenWithNamed(BuildContext context, String name) {
    Navigator.pushNamed(context, name);
  }

}