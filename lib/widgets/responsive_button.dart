import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  double width;
  bool? isResponsive;
  String? text;
  bool? isIcon;

  ResponsiveButton(
      {Key? key,
        this.isResponsive = false,
        this.isIcon = true,
        this.width = 120,
        this.text = "Hi"
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
            width: isResponsive==true ? double.maxFinite : width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.mainColor,
            ),
            child: Row(
              mainAxisAlignment: isResponsive==true ? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
              children: [
                isResponsive==true ? Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                    child: AppText(text: text!, color: Colors.white,)
                ) : Container(),
                isIcon==true ? Image.asset("img/angle.png") : Container()
              ],
            )
        )
    );
  }
}
