import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_application/core/utils/widget/dialogs/show_dialog_upload_image.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view/widget/custom_icon_navigate_between_pages.dart';
import 'package:task_management_application/features/auth/sign_up/presentation/view_model/sign_up_view_model.dart';
import '../../../../../../core/style/colors/application_color.dart';
import '../../../../../../core/utils/widget/Represent_circular_image/custom_circle_image.dart';
import '../widget/part_custom_text_field.dart';

class NameAndImageInputPart extends StatelessWidget {
   const NameAndImageInputPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            child: const CustomCircleImage(
          radiusCircleImage: 50,
          colorBorderCircle: primaryColor,
          imageProvider: AssetImage("assets/images/logo_app.png"),
        ),
          onTap: () async{
            await Provider.of<SignUpViewModel>(context,listen: false).navigator?.showDialogForUploadImage();
          },
        ),
        const SizedBox(height: 50),
        Expanded(child: PartForm()),
      ],
    );
  }
}
