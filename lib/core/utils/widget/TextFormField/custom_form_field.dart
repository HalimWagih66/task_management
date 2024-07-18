import 'package:flutter/material.dart';
import 'package:task_management_application/core/utils/widget/TextFormField/text_form_field_border.dart';

typedef FunctionValidate = String? Function(String?);
class CustomFormField extends StatelessWidget {
  final TextEditingController? inputField;
  final FunctionValidate functionValidate;
  final bool obscureText;
  final TextInputType textInputType;
  final String textLabel;
  final IconData? suffixIcon;
  final String? hintText;
  final String fontFamily;
  final InputBorder? borderField;
  final Function? onPressedSuffixIcon;
  final int maxLines;
  final int minLines;
  final String? initialValue;
  final FunctionValidate? functionOnChanged;
  final TextInputAction? textInputAction;
  const CustomFormField(
      {super.key,
        this.inputField,
      required this.functionValidate,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      required this.textLabel,
      this.suffixIcon,
      this.fontFamily = "Poppins",
       this.borderField,
        this.onPressedSuffixIcon,
        this.maxLines = 1,
        this.minLines = 1,
        this.functionOnChanged,
        this.initialValue,
        this.textInputAction, this.hintText
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textLabel,style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 1.5,decorationThickness: 0),),
         const SizedBox(height: 13),
        TextFormField(
          keyboardType: textInputType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          controller: inputField,
          validator: functionValidate,
          maxLines: maxLines,
          onChanged: functionOnChanged,
          initialValue: initialValue,
          minLines: minLines,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(decorationThickness: 0),
          decoration: InputDecoration(
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 13
            ),
            hintText: hintText,
            filled: true,
            enabled: true,
            fillColor:  const Color(0xffffffff),
            hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(color: const Color(0xff888888),fontSize: 15),
            enabledBorder:fieldBorderDefault(color: const Color(0x679b9b9b)),
              border: fieldBorderDefault(color: Colors.white),
              focusedBorder:fieldBorderDefault(color: Theme.of(context).primaryColor),
              errorBorder:fieldBorderDefault(color: Colors.red),
            focusedErrorBorder:fieldBorderDefault(color: Colors.red),
            suffixIcon:suffixIcon !=null?IconButton(
              onPressed: (){
                onPressedSuffixIcon!();
              },
              icon: Icon(
                suffixIcon,
                color: Colors.grey,
              )
            ):null,
          )
        ),
      ],
    );
  }
}
