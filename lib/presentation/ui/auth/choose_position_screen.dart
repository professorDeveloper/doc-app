import 'package:doc_app/constants/app_color.dart';
import 'package:doc_app/constants/app_images.dart';
import 'package:doc_app/navigator/navigator.dart';
import 'package:doc_app/presentation/ui/chooses/choose_massaj_age_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_style.dart';
import '../chooses/choose_age_screen.dart';
import '../chooses/choose_massaj_service_screen.dart';

class ChoosePositionScreen extends StatefulWidget {
  const ChoosePositionScreen({super.key});

  @override
  State<ChoosePositionScreen> createState() => _ChoosePositionScreenState();
}

class _ChoosePositionScreenState extends State<ChoosePositionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.White,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                // SvgPicture.asset(AppImages.logosvg,width: 100,height: 100,fit: BoxFit.cover,),
                Image(
                  image: AssetImage(AppImages.logo),
                  height: 90,
                  width: 90,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Yo’nalishni tanlang',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w600,
                    height: 1.20,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Siz qaysi yo’nalishda ishlaysiz?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF5B7087),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 22,
                    ),
                    Expanded(
                        child: Container(
                      height: 160,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF3F5F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 18,
                            top: 18,
                            child: SizedBox(
                              child: Text(
                                'Shifokor\nmuxatassist',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  height: 1.20,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      AppImages.vrachpic),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            openScreen(context, ChooseAgeScreen());
                          },
                          child: Container(
                            height: 160,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF3F5F7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 18,
                                  top: 18,
                                  child: Text(
                                    'Kichik tibbiy \nhodim',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w400,
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 6,
                                  bottom: 0,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            AppImages.tibbiyhodim),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 22,
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(
                      width: 22,
                    ),
                    Expanded(
                        child: Container(
                      height: 160,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF3F5F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 18,
                            top: 18,
                            child: SizedBox(
                              child: Text(
                                'Psixolog',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  height: 1.20,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 15,
                            bottom: 0,
                            child: Container(
                              width: 100,
                              height: 140,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      AppImages.psixolog,),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            openScreen(context, ChooseMassajAgeScreen());
                          },
                          child: Container(
                            height: 160,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF3F5F7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 18,
                                  top: 18,
                                  child: Text(
                                    'Massaj hodimi',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w400,
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 0,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            AppImages.massajicon),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                        width: 22,

                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
