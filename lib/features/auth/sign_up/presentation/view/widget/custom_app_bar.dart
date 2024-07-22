
import 'package:flutter/material.dart';

import 'custom_leading_app_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, required this.onTap, required this.iconData, required this.title});
  final void Function() onTap;
  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: CustomLeadingAppBar(onTap: onTap,iconData: iconData
      ),
      title: Text(title,style: Theme.of(context).textTheme.titleLarge,),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 65);
}
