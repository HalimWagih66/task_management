import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view_model/sign_up_view_model.dart';
import '../../../../../../core/style/colors/application_color.dart';
import '../../../../../../core/utils/widget/Represent_circular_image/custom_circle_image.dart';
import '../widget/custom_icon_navigate_between_pages.dart';
import '../widget/display_message_If_Image_Not_Found.dart';
import '../widget/form_sign_up_name_user.dart';

class FormSignUpNameAndImageUser extends StatefulWidget {
    const FormSignUpNameAndImageUser({super.key});

  @override
  State<FormSignUpNameAndImageUser> createState() => _NameAndImageInputPartState();
}

class _NameAndImageInputPartState extends State<FormSignUpNameAndImageUser> {
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

   bool isFoundImage = true;

   @override
  Widget build(BuildContext context) {
    var signUpViewModel = Provider.of<SignUpViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            child: CustomCircleImage(
          radiusCircleImage: 70,
          colorBorderCircle: primaryColor,
          imageProvider: signUpViewModel.pickedImage != null?FileImage(signUpViewModel.pickedImage!):null
        ),
          onTap: () async{
            await Provider.of<SignUpViewModel>(context,listen: false).navigator?.showDialogForUploadImage();
          },
        ),
        isFoundImage ? const SizedBox(height: 50) : const DisplayMessageIfImageNotFound(),
        Expanded(child: FormSignUpNameUser(formKey: formKey)),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomIconNavigateBetweenPages(
              onPressed: () {
                validateForm(signUpViewModel);
              }, iconData: Icons.navigate_next
          ),
        )
      ],
    );
  }

   void validateForm(SignUpViewModel signUpViewModel) {
     if(formKey.currentState!.validate()){
       if (checkImageIsFoundOrNot(signUpViewModel)) {
         signUpViewModel.userInformationModel.pathImage = signUpViewModel.pickedImage?.path;
         signUpViewModel.nextPageViewBuilder();
       }
     }
     checkImageIsFoundOrNot(signUpViewModel);
   }
   bool checkImageIsFoundOrNot(SignUpViewModel signUpViewModel){
     if(signUpViewModel.pickedImage == null){
       isFoundImage = false;
     }else{
       isFoundImage = true;
     }
     setState(() {});
     return isFoundImage;
   }
}