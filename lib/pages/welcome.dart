import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/button.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key, required String title}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List images = [
    "kukri-mukri-01.jpeg",
    "kukri-mukri-02.jpeg",
    "kukri-mukri-03.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
                height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/${images[index]}"),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips",),
                        AppText(text: "Mountain", size: 30),
                        const SizedBox(height: 20,),
                        SizedBox(
                          width: 250,
                            child: AppText(
                              color: AppColors.textColor2,
                                size: 14,
                                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum accumsan pellentesque. Nunc in mauris eu metus vulputate tempor ac a turpis. Etiam blandit sagittis felis, vel varius dolor ullamcorper at. Donec quis iaculis arcu. Etiam hendrerit elementum purus eget suscipit. "
                            )
                        ),
                        const SizedBox(height: 40,),
                        Button(width: 120,)
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots){
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                            height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:  index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                          ),
                        );
                      })
                    )
                  ],
                ),
              ),
            );
          }
      ),

    );
  }
}
