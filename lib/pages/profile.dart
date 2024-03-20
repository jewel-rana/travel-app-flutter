import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: 160,
          child: Container(
            height: 50,
            width: 50,
            color: AppColors.mainBgColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://via.placeholder.com/50x50'),
                    backgroundColor: AppColors.textColor1,
                  ),
              ],
            )
            
          ),
      ),
    );
  }
}
