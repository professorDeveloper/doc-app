import 'package:doc_app/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_images.dart';
import '../kichikhodim/use/detail_dialog.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Gray2,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 22,
            ),
            Text(
              'Buyurtmalar (123)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 13,horizontal:1),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 13,
                          ),
                          Row(
                            children: [
                              Text(
                                '15 Daqiqa oldin',
                                style: TextStyle(
                                  color: AppColor.Gray4,
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              SvgPicture.asset(AppImages.location,
                                  color: AppColor.Gray5),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '12km uzoqlikda',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF8F96A0),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 14,
                                height: 14,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 14,
                                        height: 14,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFE6F2FF),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 2.80,
                                      top: 2.80,
                                      child: Container(
                                        width: 8.40,
                                        height: 8.40,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF007BFF),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Chilonzor tumani, 6 mavze, 20 uy',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFE6F2FF),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  AppImages.serviceiconkichiktibbiyhodim),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Inyeksiya yonboshdan, Kapelnisa',
                                style: TextStyle(
                                  color: Color(0xFF5E646B),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFE6F2FF),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFE6F2FF)),
                                  borderRadius: BorderRadius.circular(50),
                                )),
                                child: Center(
                                  child: Text(
                                    'Kottalar uchun',
                                    style: TextStyle(
                                      color: Color(0xFF007BFF),
                                      fontSize: 14,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '100 000 uzs',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {
                                    showDetailDialog(context);
                                  },
                                  highlightElevation: 0,
                                  // Bosilganda ham soyani yo'qotish
                                  child: Center(
                                    child: Text(
                                      'Batafsil',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  disabledElevation: 0,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  elevation: 0,
                                  focusElevation: 0,
                                  color: AppColor.Gray2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12,),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  highlightElevation: 0,
                                  // Bosilganda ham soyani yo'qotish
                                  child: Center(
                                    child: Text(
                                      'Qabul qilish',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  disabledElevation: 0,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  elevation: 0,
                                  focusElevation: 0,
                                  color: AppColor.BlueMain,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
