import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  var images = {
    "img/004-hiking.png" : "Hiking",
    "img/005-kayak.png" : "Kayaking",
    "img/006-hot-air-balloon.png" : "Balloning",
    "img/001-snorkel.png" : "Snorkel"
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("img/user.webp"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [AppLargeText(text: "Discover")],
              )),
          const SizedBox(height: 30),
          Align(
              alignment: Alignment.bottomLeft,
              child: TabBar(
                labelPadding:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                controller: tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  AppText(text: "Places"),
                  AppText(text: "Inspiration"),
                  AppText(text: "Emotions"),
                ],
              )),
          Container(
            height: 300,
            width: double.maxFinite,
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: AssetImage("img/kukri-mukri-01.jpeg"),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
                const Text("Inspirations"),
                const Text("Emotions"),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore more",
                  size: 18,
                ),
                AppText(
                  text: "see all",
                  color: AppColors.textColor1,
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Container(
                        // margin: const EdgeInsets.only(right: 50),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image:  DecorationImage(
                                image: AssetImage(images.keys.elementAt(index)),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      // const SizedBox(height: 5),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: AppText(text: images.values.elementAt(index), color: AppColors.textColor2),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius:radius);
  }

}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height - radius/2);
    canvas.drawCircle(offset+circleOffset, radius, paint);
  }

}