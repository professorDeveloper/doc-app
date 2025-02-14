import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../../../../animations/custom_animation.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_style.dart';
import '../../../helpers/flushbar.dart';

class MassajEnterExtraInfoScreen extends StatefulWidget {
  final VoidCallback onNext;
  MassajEnterExtraInfoScreen({required this.onNext});

  @override
  State<MassajEnterExtraInfoScreen> createState() => _SmallDoctorEnterExtraInfoScreenState();
}

class _SmallDoctorEnterExtraInfoScreenState extends State<MassajEnterExtraInfoScreen> {
  var extracontroller=TextEditingController();
  var extraError="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAnimationsSlide(
        direction: FadeSlideDirection.btt,
        duration: 0.8,
        child: Container(
          height: Device.get().isAndroid ? 50 : 55,
          margin: EdgeInsets.symmetric(
              horizontal: 20, vertical: Device.get().isAndroid ? 20 : 25),
          width: double.infinity,
          child: MaterialButton(
            color: AppColor.BlueMain,
            onPressed: () async {
              if (extracontroller.text.isEmpty) {
                showErrorFlushBar("Batafsil malumot kiritilmagan !").show(context);
                extraError = "Batafsil malumot kiritilmagan !";
                setState(() {});
                await Future.delayed(Duration(seconds: 3));
                extraError = "";
                setState(() {});

              }
              else{
                widget.onNext();
              }
            },
            elevation: 0,
            highlightElevation: 0,
            focusElevation: 0,
            textColor: AppColor.White,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Spacer(),
                Text("Davom etish"),
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
      ),

      body: Column(
        children: [
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    "O’zingiz haqida batafsil ma’lumot",
                    style: AppStyle.sfproDisplay14w400Black,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  autofocus: true,
                  maxLines: 10,
                  controller: extracontroller,
                  style: TextStyle(
                    fontFamily: "SfProDisplay",
                    color: AppColor.Black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Kiriting...",
                    errorText: extraError.isEmpty ? null : extraError,
                    hintStyle: TextStyle(color: AppColor.Gray3, fontSize: 14),
                    filled: true,
                    fillColor: AppColor.Gray,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColor.Gray,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColor.Gray,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColor.BlueMain, // Change this to focus color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
