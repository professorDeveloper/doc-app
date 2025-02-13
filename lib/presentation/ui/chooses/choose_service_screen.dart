import 'package:doc_app/presentation/ui/kichikhodim/auth/PagerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/svg.dart';

import '../../../animations/custom_animation.dart';
import '../../../constants/app_color.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_style.dart';
import '../../../navigator/navigator.dart';
import '../../../utils/reg_data.dart';

class ChooseServiceScreen extends StatefulWidget {
  const ChooseServiceScreen({super.key});

  @override
  State<ChooseServiceScreen> createState() => _ChooseServiceScreenState();
}

class _ChooseServiceScreenState extends State<ChooseServiceScreen> {
  int? _selectedValue = 0;
  List<String> services=["Kapelnisa","Bemorga qarash","Davlenya olchash","Tez tibbiy"];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var reg = RegData();
    print(reg.getAgeResponse()!.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.Gray1,
        bottomNavigationBar: CustomAnimationsSlide(
          direction: FadeSlideDirection.btt,
          duration: 0.8,
          child: Container(
            height: 94,
            color: AppColor.White,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: MaterialButton(
                color: AppColor.BlueMain,
                onPressed: _selectedValue == 0
                    ? null
                    : () {
                        openScreen(context, SmallDoctorPagerScreen());
                        // var regdata = RegData();
                        // regdata.setAgeResponse(
                        //     state.ageList[_selectedValue! - 1]);
                        // openScreen(context, ChooseServiceScreen());
                      },
                elevation: 0,
                highlightElevation: 0,
                disabledColor: AppColor.BlueLight,
                focusElevation: 0,
                textColor: AppColor.White,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'Davom etish',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
        ),
        appBar: AppBar(
          backgroundColor: AppColor.White,
          elevation: Device.get().isAndroid ? 0.4 : 0.1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Qanday xizmatlar ko’rsatasiz?',
            style: AppStyle.sfproDisplay16Black,
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() {
                      _selectedValue = index + 1;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white, // Kartochkaning fon rangi
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SvgPicture.asset(
                            AppImages.tibbiyhodimserviceicon,
                            // Rasmni shu yo'ldan qo'shing
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(width: 12), // Rasm va matn orasidagi bo‘sh joy
                        Expanded(
                          child: Text(services[index],
                              style: TextStyle(fontSize: 16)),
                        ),
                        Radio<int>(
                          value: index + 1,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                          activeColor:
                              AppColor.BlueMain, // Faqat to'ldirish rangi
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
