import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_colors.dart';

class AppInputField extends StatefulWidget {

  String? hint;
  IconData? icon;
  final Color color;
  Color? iconColor;
  TextInputType? inputType;
  bool isPassword;
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

  @override
  State<StatefulWidget> createState() => _AppInputField();

}
class _AppInputField extends State<AppInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: const Offset(1, 1),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(
        obscureText: widget.isPassword == true,
        decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: IconButton(
              icon: Icon(widget.isPassword == true
                  ? (widget.passwordVisible == true ? Icons.visibility : Icons.visibility_off)
                  : widget.icon),
              onPressed: () => setState(() {
                widget.passwordVisible = !widget.passwordVisible;
                widget.isPassword = !widget.isPassword;
              })
            ),
            contentPadding: const EdgeInsets.only(left: 10, right: 10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: widget.color,
                  width: 1.0,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: widget.color,
                  width: 1.0,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30))),
        keyboardType: widget.inputType,
        textInputAction: TextInputAction.done,
      ),
    );
  }

}