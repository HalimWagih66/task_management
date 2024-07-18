import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../core/utils/widget/TextFormField/custom_form_field.dart';
import 'custom_icon_navigate_between_pages.dart';

class PartForm extends StatelessWidget {
  PartForm({super.key});
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomFormField(
                hintText: "ex: Smith",
                textLabel: AppLocalizations.of(context)!.first_name,
                functionValidate: (text) {
                  if (text == null || text.trim().isEmpty == true) {
                    return AppLocalizations.of(context)!.please_enter_your_name;
                  }
                  if(text.contains(" ") == true){
                    return AppLocalizations.of(context)!.please_enter_your_first_name_only;
                  }
                },
                borderField: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue, style: BorderStyle.solid, width: 2)),
              ),
              const SizedBox(height: 50),
              CustomFormField(
                hintText: "ex: john",
                textLabel: AppLocalizations.of(context)!.last_name,
                functionValidate: (text) {
                  if (text == null || text.trim().isEmpty == true) {
                    return AppLocalizations.of(context)!.please_enter_your_name;
                  }
                  if(text.contains(" ") == true){
                    return AppLocalizations.of(context)!.please_enter_your_first_name_only;
                  }
                },
                borderField: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue, style: BorderStyle.solid, width: 2)),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomIconNavigateBetweenPages(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    print("formKey.currentState!.validate()");
                  }
                }, iconData: Icons.navigate_next),
          )
        ],
      ),
    );
  }
}
