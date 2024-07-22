import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_application/core/utils/functions/validate/regex.dart';

class ValidateInputsFromTextValid{
  static String? validateEmailValid(BuildContext context,String? input){
    if (input?.isEmpty == true || input?.trim().isEmpty == true) {
      return AppLocalizations.of(context)!.please_enter_email_address;
    }
    if (!Regex.isEmailValid(input!)) {
      return AppLocalizations.of(context)!.please_enter_the_email_correctly;
    }
    return null;
  }
  static String? validatePasswordValid(BuildContext context,String? input){
    if (input?.isEmpty == true || input?.trim().isEmpty == true) {
      return AppLocalizations.of(context)!.please_enter_password;
    }
    else if (input!.length < 6) {
      return AppLocalizations.of(context)!.please_enter_a_password_that_is_more_than_6_digits;
    }
    return null;
  }
  static String? validateFirstNameValid(BuildContext context,String? input) {
    if (input == null || input.trim().isEmpty == true) {
      return AppLocalizations.of(context)!.please_enter_your_name;
    }
    if (input.contains(" ") == true) {
      return AppLocalizations.of(context)!.please_enter_your_first_name_only;
    }
    return null;
  }
  static String? validateLastNameValid(BuildContext context,String? input) {
    if (input == null || input.trim().isEmpty == true) {
      return AppLocalizations.of(context)!.please_enter_your_last_name_only;
    }
    if(input.contains(" ") == true){
      return AppLocalizations.of(context)!.please_enter_your_last_name_only;
    }
    return null;
  }
}