import 'package:doc_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_images.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.Gray2,
        appBar: AppBar(
          elevation: 0.3,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  child: SvgPicture.asset(AppImages.menu),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: ShapeDecoration(
                  color: Color(0xFFF3F5F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '100 000 uzs',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.BlueMain),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 18,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: SvgPicture.asset(AppImages.notification),
                ),
              )
            ],
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12,vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: AppColor.Gray2,

              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: TabBar(

                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                    color: AppColor.White,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tabs: [
                    Tab(
                      text: "Harita ko’rinishida",
                    ),
                    Tab(
                      text: "Ro’yxat ko’rinishida",
                    )
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: AppColor.White,
        ),
      ),
    );
  }
}
