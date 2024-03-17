import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

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
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("http://mark.bslmeiyu.com/uploads/${detail.place.img}"),
                              fit: BoxFit.cover)
                      ),
                    )),
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
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: const Icon(Icons.menu),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    top: 320,
                    left: 0,
                    bottom: 90,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(
                                  text: detail.place.name,
                                  color: Colors.black54,
                                  size: 27,
                                ),
                                AppLargeText(
                                  text: "\$ ${detail.place.price}",
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
                                  text: detail.place.location,
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
                                      color: index < detail.place.stars
                                          ? AppColors.starColor
                                          : AppColors.textColor1);
                                }),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppText(
                                text: "(5.0)",
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
                                  text: "People",
                                  color: Colors.black.withOpacity(0.8),
                                  size: 19,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                            const SizedBox(
                              height: 5,
                            ),
                            Row(children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                      if (kDebugMode) {
                                        print(index + 1);
                                      }
                                    },
                                    child: Button(
                                      size: 50,
                                      backgroundColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      borderColor: AppColors.buttonBackground,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : AppColors.mainTextColor,
                                      text: (index + 1).toString(),
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(
                                height: 15,
                              )
                            ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  text: "Description",
                                  color: Colors.black.withOpacity(0.8),
                                  size: 19,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: detail.place.description,
                              color: AppColors.mainTextColor,
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        Button(
                          size: 50,
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor1,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        const SizedBox(width: 20,),
                        ResponsiveButton(text: "Book now", isResponsive: true,)
                      ],
                    )
                )
              ],
            ),
          ));
    },
    );
  }
}
