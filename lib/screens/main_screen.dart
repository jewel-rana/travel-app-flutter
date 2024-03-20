import 'package:flutter/material.dart';
import 'package:travel_app/pages/chart.dart';
import 'package:travel_app/pages/profile.dart';
import 'package:travel_app/pages/search.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/utils/app_colors.dart';
import '../pages/login.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [
    const Home(),
    const Chart(),
    const Search(),
    const Profile(),
    const Login()
  ];
  int defaultPage = 0;
  void onTap(index){
    setState(() => defaultPage = index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome", textAlign: TextAlign.center,),
        backgroundColor: AppColors.mainBgColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: () {  },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
        ],
      ),
      body: pages[defaultPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: defaultPage,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: AppColors.mainTextColor,
        selectedItemColor: AppColors.mainColor,
        elevation: 2,
        onTap: onTap,
        iconSize: 34,
        backgroundColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Bar"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
        ],
      ),
    );
  }
}
