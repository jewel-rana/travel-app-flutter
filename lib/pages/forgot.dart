import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/login.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/widgets/app_input_field.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import '../utils/button.dart';
import 'package:get/get.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: w,
              height: h * .25,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/welcome-three.jpg"),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLargeText(text: "Forgot password?"),
                  const SizedBox(height: 10,),
                  AppText(text: "Reset your password now."),
                  const SizedBox(
                    height: 50,
                  ),
                  AppInputField(
                      hint: "Email address",
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Button(
              width: 120,
              color: Colors.white,
              backgroundColor: AppColors.mainColor,
              borderColor: AppColors.mainColor,
              isIcon: false,
              text: "Forgot",
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(
                    text: "Back to ",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                    children: [
                  TextSpan(
                    text: " Login?",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => const Login()),
                  )
                ])),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
