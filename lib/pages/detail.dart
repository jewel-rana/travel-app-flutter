import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int givenRating = 4;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
              left: 20,
              top: 50,
              child: Container(
                width: double.maxFinite,
                height: 80,
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    ),
                  ],
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/welcome-one.jpg"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Yosemite",
                          color: Colors.black54,
                        ),
                        AppLargeText(
                          text: "\$ 250",
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "US, California",
                          color: AppColors.textColor1,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(Icons.star,
                              color: index < givenRating
                                  ? AppColors.starColor
                                  : AppColors.textColor1);
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text: "(4/5)",
                        color: AppColors.textColor2,
                      )
                    ]),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppLargeText(
                            text: "People", color: Colors.black.withOpacity(0.8), size: 19,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(
                          text: "People are always guilty",
                          color: AppColors.mainTextColor,
                        )
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                                print(index + 1);
                              },
                              child: Button(
                                size: 50,
                                backgroundColor:selectedIndex==index? Colors.black : AppColors.buttonBackground,
                                borderColor: AppColors.buttonBackground,
                                color: selectedIndex == index?Colors.white: AppColors.mainTextColor,
                                text: (index+1).toString(),
                              ),
                            );
                          }),
                      ),
                        const SizedBox(height: 15,)
                      ]
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: "Description", color: Colors.black.withOpacity(0.8), size: 19,),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(
                          text: "This is really a nice description. thanks for your opinion",
                          color: AppColors.mainTextColor,
                        )
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
