// import 'package:flutter/material.dart';
//
// import 'custom_leading_item.dart';
//
//
//
// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({super.key, required this.titleAppBar, this.onPressed, this.icon});
//   final String titleAppBar;
//   final Function? onPressed;
//   final IconData? icon;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 28.0),
//       child: ListTile(
//           leading: CustomLeadingItem(
//             colorIcon: Colors.white,
//             icon: icon??Icons.menu,
//             onPressed: () {
//               if(onPressed!=null){
//                 onPressed!();
//               }else{
//                 ZoomDrawer.of(context)?.open();
//               }
//             }
//           ),
//           title:Align(
//               alignment: Alignment.topCenter,
//               child: Text(titleAppBar,
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Provider.of<SettingsProvider>(context,listen: false).getSecondColor()))),
//       ),
//     );
//   }
// }
