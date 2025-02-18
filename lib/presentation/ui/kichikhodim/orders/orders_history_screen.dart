import 'package:doc_app/constants/app_images.dart';
import 'package:doc_app/navigator/navigator.dart';
import 'package:doc_app/presentation/ui/kichikhodim/orders/info_success_order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_style.dart';

class OrdersHistoryScreen extends StatefulWidget {
  const OrdersHistoryScreen({super.key});

  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Gray2,
      appBar: AppBar(
        backgroundColor: AppColor.White,
        toolbarHeight: 60,
        actions: [
          SvgPicture.asset(AppImages.filter),
          SizedBox(
            width: 14,
          ),
        ],
        elevation: Device.get().isAndroid ? 0.4 : 0.1,
        leading: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Buyurtmalar tarixi',
          style: AppStyle.sfproDisplay16Black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(13),
              onTap: (){
                openScreen(context, SuccessOrderInfoScreen());
              },

              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFFE5EAEF),
                      blurRadius: 18,
                      offset: Offset(0, 9),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child:Column(
                  children: [
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Text(
                          'Kecha, 02.01.2025',
                          style: TextStyle(
                            color: Color(0xFF8F96A0),
                            fontSize: 12,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(AppImages.paper),
                        SizedBox(width: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFE6F7EB),
                          ),
                          child: Text(
                            'Yakunlandi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.Green,
                              fontSize: 12,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        SvgPicture.asset(AppImages.location,),
                        SizedBox(width: 9,),
                        Text(
                          'Toshkent Shahar, Yunusobod 6, 20 uy',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),
                        )
                      ],

                    ),
                    SizedBox(height: 12,),

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
                    SizedBox(height: 12,),
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
                    SizedBox(height: 12,),

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
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Text(
                          'Umumiy summa',
                          style: TextStyle(
                            color: Color(0xFF8F96A0),
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
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
                        )
                      ],
                    ),
                    SizedBox(height: 12,),


                  ],
                )
              ),
            );
          },
        ),
      ),
    );
  }
}
