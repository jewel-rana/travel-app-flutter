import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

import 'app_colors.dart';

class Button extends StatelessWidget {
  Color color;
  final Color backgroundColor;
  double width;
  double? height;
  final Color borderColor;
  String? text;
  bool? isIcon;
  IconData? icon;
  Button({Key? key,
    this.isIcon = false,
    this.text = "2",
    this.icon = Icons.abc,
    required this.width,
    this.height = 50,
    this.color = AppColors.buttonBackground,
    required this.backgroundColor,
    required this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
      ),
      child: Center(
        child: isIcon == false ? AppText(text: text!, color: color,) : Icon(icon),
      )
    );
  }
}
