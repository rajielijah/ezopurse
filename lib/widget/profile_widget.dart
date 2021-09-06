import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget profile(BuildContext context, SvgPicture image, Text title, Icon trailing){
  return Padding(
    padding: const EdgeInsets.only(left:20.0, right: 20),
    child: Column(
      children: [
        ListTile(
          leading: image,
          title: title,
          trailing: trailing,
        ),
        Divider()
      ],
    ),
  );
}