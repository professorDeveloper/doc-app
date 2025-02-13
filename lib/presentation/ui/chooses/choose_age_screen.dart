import 'package:doc_app/animations/custom_animation.dart';
import 'package:doc_app/constants/app_images.dart';
import 'package:doc_app/presentation/ui/chooses/choose_service_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/choose/choose_bloc.dart';
import '../../../constants/app_color.dart';
import '../../../constants/app_style.dart';
import '../../../navigator/navigator.dart';
import '../../../utils/reg_data.dart';
import '../../helpers/flushbar.dart';

class ChooseAgeScreen extends StatefulWidget {
  const ChooseAgeScreen({super.key});

  @override
  State<ChooseAgeScreen> createState() => _ChooseAgeScreenState();
}

class _ChooseAgeScreenState extends State<ChooseAgeScreen> {
  int? _selectedValue = 0;
  late ChooseBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.of<ChooseBloc>(context);
    bloc.add(FetchChooseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChooseBloc, ChooseState>(
      listener: (context, state) {
        if (state is ChooseSuccessState) {
          print(state.ageList.toString());
        } else if (state is ChooseErrorState) {
          // showErrorFlushBar(state.message).show(context);
        }
      },
      builder: (context, state) {
        if (state is ChooseLoading) {
          return Scaffold(
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
                  'Tegishli sozlamalarni tanlang',
                  style: AppStyle.sfproDisplay16Black,
                ),
                centerTitle: true,
              ),
              backgroundColor: AppColor.Gray1,
              body: Center(
                child: CircularProgressIndicator(color: AppColor.BlueMain),
              ));
        } else if (state is ChooseSuccessState) {
          return Scaffold(
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
                              var regdata = RegData();
                              regdata.setAgeResponse(
                                  state.ageList[_selectedValue! - 1]);
                              openScreen(context, ChooseServiceScreen());
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
                  'Tegishli sozlamalarni tanlang',
                  style: AppStyle.sfproDisplay16Black,
                ),
                centerTitle: true,
              ),
              backgroundColor: AppColor.Gray1,
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: Text(
                        'Qaysi yoshdagilar ko’rigini amalga oshirasiz?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        setState(() {
                          _selectedValue = 1;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white, // Kartochkaning fon rangi
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SvgPicture.asset(
                                AppImages
                                    .bothchoose, // Rasmni shu yo'ldan qo'shing
                                width: 40,
                                height: 40,
                              ),
                            ),
                            SizedBox(
                                width: 12), // Rasm va matn orasidagi bo‘sh joy
                            Expanded(
                              child: Text("Ikkisini ham",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Radio<int>(
                              value: 1,
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
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        setState(() {
                          _selectedValue = 2;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white, // Kartochkaning fon rangi
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SvgPicture.asset(
                                AppImages
                                    .bigchoose, // Rasmni shu yo'ldan qo'shing
                                width: 40,
                                height: 40,
                              ),
                            ),
                            SizedBox(
                                width: 12), // Rasm va matn orasidagi bo‘sh joy
                            Expanded(
                              child: Text("Faqat kattalar",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Radio<int>(
                              value: 2,
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
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        setState(() {
                          _selectedValue = 3;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white, // Kartochkaning fon rangi
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SvgPicture.asset(
                                AppImages.youngchoose,
                                // Rasmni shu yo'ldan qo'shing
                                width: 40,
                                height: 40,
                              ),
                            ),
                            SizedBox(
                                width: 12), // Rasm va matn orasidagi bo‘sh joy
                            Expanded(
                              child: Text("Faqat yoshlar",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Radio<int>(
                              value: 3,
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
                  ]));
        }
        return Scaffold(
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
                            openScreen(context, ChooseServiceScreen());
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
                'Tegishli sozlamalarni tanlang',
                style: AppStyle.sfproDisplay16Black,
              ),
              centerTitle: true,
            ),
            backgroundColor: AppColor.Gray1,
            body: Center(
              child: CircularProgressIndicator(
                color: AppColor.BlueMain,
              ),
            ));
      },
    );
  }
}
