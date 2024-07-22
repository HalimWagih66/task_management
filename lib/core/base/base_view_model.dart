import 'package:flutter/material.dart';
import 'package:task_management_application/core/base/base_navigator.dart';

class BaseViewModel<Nav extends BaseNavigator> extends ChangeNotifier{
  Nav? navigator;
}