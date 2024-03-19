import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_colors.dart';

class AppInputField extends StatelessWidget {
  String? hint;
  IconData? icon;
  final Color color;
  Color? iconColor;
  TextInputType? inputType;
  bool? isPassword;
  bool passwordVisible;
  AppInputField({Key? key,
    this.hint = "Write here...",
    this.icon = Icons.circle,
    this.color = Colors.white,
    this.iconColor = AppColors.mainColor,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.passwordVisible = false,
  }) : super(key: key);


  void setState(Function() passwordVisible) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: const Offset(1, 1),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(
        obscureText: isPassword == true,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: IconButton(
              icon: Icon(isPassword == true
                  ? (passwordVisible == true ? Icons.visibility : Icons.visibility_off)
                  : icon),
              onPressed: () => !passwordVisible
            ),
            contentPadding: const EdgeInsets.only(left: 10, right: 10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: color,
                  width: 1.0,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: color,
                  width: 1.0,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30))),
        keyboardType: inputType,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}