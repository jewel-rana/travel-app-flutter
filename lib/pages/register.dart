import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/widgets/app_input_field.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import '../utils/button.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  AppLargeText(text: "Hello"),
                  AppText(text: "Sign into your account"),
                  const SizedBox(
                    height: 30,
                  ),
                  AppInputField(hint: "Email address", icon: Icons.email, inputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 20,
                  ),
                  AppInputField(hint: "Password", icon: Icons.password, isPassword: true,),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      AppText(text: "Forgot your password?"),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Button(
              width: 100,
              color: Colors.white,
              backgroundColor: AppColors.mainColor,
              borderColor: AppColors.mainColor,
              isIcon: false,
              text: "Sign in",
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(
                    text: "Don\'t have an account?",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                    children: [
                      TextSpan(
                        text: " Create",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => Home()),
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
