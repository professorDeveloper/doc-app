import 'package:doc_app/navigator/navigator.dart';
import 'package:doc_app/presentation/ui/kichikhodim/orders/active_order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/app_style.dart';
import '../orders/order_page_screen.dart';

void showDetailDialog(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    backgroundColor: Colors.white,
    context: context,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    isScrollControlled: true,
    builder: (context) => DetailDialog(),
  );
}
class DetailDialog extends StatefulWidget {
  const DetailDialog({super.key});

  @override
  State<DetailDialog> createState() => _DetailDialogState();
}

class _DetailDialogState extends State<DetailDialog> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.96,
      child: Container(
        color: AppColor.Gray1,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),

              width: double.infinity,
                color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24,),
                      Text(
                        'Buyurtma haqida',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '15 Daqiqa oldin',
                        style: TextStyle(
                          color: Color(0xFF8F96A0),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 18,),

                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: IconButton(icon: Icon(Icons.close), onPressed: () {
                      closeScreen(context);
                    },),
                  )
                ],
              ),
            ),
            SizedBox(height: 13,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),

              child: Column(
                children: [
                  SizedBox(height: 16,),
                  Row(children: [
                    Container(
                      width: 16,
                      height: 16,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: ShapeDecoration(
                                color: Color(0xFFE6F2FF),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 3.20,
                            top: 3.20,
                            child: Container(
                              width: 9.60,
                              height: 9.60,
                              decoration: ShapeDecoration(
                                color: Color(0xFF007BFF),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width:8,),
                    Text(
                      'Chilonzor tumani, 6 mavze, 20 uy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [

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
                  SizedBox(height: 18,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        height: 180,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.mapplaceholder),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      Positioned(child: SvgPicture.asset(AppImages.marker)),
                      Positioned(
                        bottom: 4,
                        child: Container(
                          child:MaterialButton(onPressed: () {},
                            color:AppColor.White,
                            elevation: 0,
                            highlightElevation: 0,
                            focusElevation: 0,
                            textColor: AppColor.Black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                              child: Text(
                                'Haritada ko’rish',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ) ,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 18,),



                ],
              ),
            ),
            SizedBox(height: 13,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 18,),
                  Text(
                    'Xizmatlar soni',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text(
                    'Inyeksiya yonboshdan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text(
                        '3 kun, 2 mahal',
                        style: TextStyle(
                          color: Color(0xFF8F96A0),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '100 000 сум',
                        style: TextStyle(
                          color: Color(0xFF5E646B),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: Color(0xFF5E646B),
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
                  Text(
                    'Bemor qarash',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text(
                        '3 kun',
                        style: TextStyle(
                          color: Color(0xFF8F96A0),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '100 000 сум',
                        style: TextStyle(
                          color: Color(0xFF5E646B),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: Color(0xFF5E646B),
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
                  Text(
                    'Inyeksiya yonboshdan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text(
                        '3 kun, 2 mahal',
                        style: TextStyle(
                          color: Color(0xFF8F96A0),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '100 000 сум',
                        style: TextStyle(
                          color: Color(0xFF5E646B),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 18,),

                ],
            )),
            Spacer(),
            Container(
              color: Colors.white,
              height: 120,
              child: Column(
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Umumiy summa",
                        style: AppStyle.sfproDisplay16Gray5,
                      ),
                      Spacer(),
                      Text(
                        "100 000 сум",
                        style: AppStyle.sfproDisplay18Black.copyWith(
                            fontSize: 16,
                            color: AppColor.BlueMain,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                    child: MaterialButton(
                      color: AppColor.BlueMain,
                      onPressed: () async {
                        openScreen(context, OrderPagerScreen());
                      },
                      elevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      height: 55,
                      textColor: AppColor.White,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          Text("Qabul qilish"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 24,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

