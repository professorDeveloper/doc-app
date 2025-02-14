import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_images.dart';

Widget buildMenuItem(dynamic icon, bool isSvg, String title, Function onTap,
    {Widget? trailing}) {
  return isSvg
      ? ListTile(
          leading: SvgPicture.asset(icon),
          title: Text(title),
          trailing: trailing,
          onTap: () {
            // Add menu item functionality here
          },
        )
      : ListTile(
          leading: Icon(icon, color: Colors.grey),
          title: Text(title),
          trailing: trailing,
          onTap:icon==AppImages.more?(){
            print("object123");
          }: onTap(),
        );
}
