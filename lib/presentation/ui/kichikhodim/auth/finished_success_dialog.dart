import 'package:doc_app/constants/app_images.dart';
import 'package:doc_app/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_color.dart';
import '../../main/main_screen.dart';

void showFinishedSuccessDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        content: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Dialogni faqat kerakli joyni egallashini ta'minlaydi
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    AppImages.sucess,
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ro’yhatdan o’tish\n muvaffaqiyatli yakunlandi!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                      height: 1.40,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Ma’lumotlaringiz tekshirilganidan so’ng, sizga ishlashga ruxsat beriladi. Odatda tekshirish 2-4 nsoat ichida amalga oshiriladi!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5E646B),
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: Device.get().isAndroid ? 50 : 55,
                    child: MaterialButton(
                      highlightElevation: 0,
                      // Bosilganda ham soyani yo'qotish
                      disabledElevation: 0,
                      elevation: 0,
                      focusElevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Asosiy sahifa',
                              style: TextStyle(
                                color: AppColor.White,
                                fontSize: 14,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      onPressed: () async {
                        // openReplaceScreen(context, MainScreen());
                      },
                      color: AppColor.BlueMain,
                    ),
                  ),

                ],
              ),
            ),
      ));
}
