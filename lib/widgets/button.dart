import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class Button extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isResponsive;
  bool? isIcon;
  Button({Key? key,
    this.text,
    this.icon,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
    this.isResponsive = false,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor
      ),
      child: isIcon==true?AppText(text: text!, color: color,):Icon(icon)
    );
  }
}
