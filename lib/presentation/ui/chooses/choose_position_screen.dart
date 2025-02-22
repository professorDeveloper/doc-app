import 'dart:convert';

import 'package:doc_app/constants/app_color.dart';
import 'package:doc_app/constants/app_images.dart';
import 'package:doc_app/core/models/responses/choose/staff_type.dart';
import 'package:doc_app/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/choose/choose_bloc.dart';
import '../../../constants/app_style.dart';
import 'choose_age_screen.dart';

class ChoosePositionScreen extends StatefulWidget {
  const ChoosePositionScreen({super.key});

  @override
  State<ChoosePositionScreen> createState() => _ChoosePositionScreenState();
}

class _ChoosePositionScreenState extends State<ChoosePositionScreen>  {
  late ChooseBloc _chooseBloc;
  late List<StaffType> staffTypeList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chooseBloc = BlocProvider.of<ChooseBloc>(context);
    _chooseBloc.add(FetchChoosePositionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseBloc, ChooseState>(
      builder: (context, state) {
        if (state is ChoosePositionSuccessState) {
          staffTypeList = state.positionList;
          return Scaffold(
            backgroundColor: AppColor.White,
            body: SingleChildScrollView(
              child: Column(
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
                          height: 25,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: (state.positionList.length / 2).ceil(),
                          itemBuilder: (context, index) {
                            int firstIndex = index * 2;
                            int secondIndex = firstIndex + 1;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 22,
                                  ),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      openScreen(
                                          context,
                                          ChooseAgeScreen(
                                            staffType:
                                                state.positionList[firstIndex],
                                          ));
                                    },
                                    child: Container(
                                      height: 160,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF3F5F7),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 18,
                                            top: 18,
                                            child: SizedBox(
                                              child: Text(
                                                convertPostionName(state
                                                            .positionList[
                                                                firstIndex]
                                                            .name) ==
                                                        ""
                                                    ? state
                                                        .positionList[
                                                            firstIndex]
                                                        .name
                                                    : convertPostionName(state
                                                        .positionList[
                                                            firstIndex]
                                                        .name),
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
                                              height: 120,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(state
                                                      .positionList[firstIndex]
                                                      .image),
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
                                    width: 12,
                                  ),
                                  secondIndex < state.positionList.length
                                      ? Expanded(
                                          child: GestureDetector(
                                          onTap: () {
                                            openScreen(
                                                context,
                                                ChooseAgeScreen(
                                                  staffType: state.positionList[
                                                      secondIndex],
                                                ));
                                          },
                                          child: Container(
                                            height: 160,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFF3F5F7),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 18,
                                                  top: 18,
                                                  child: Text(
                                                    convertPostionName(state
                                                                .positionList[
                                                                    secondIndex]
                                                                .name) ==
                                                            ""
                                                        ? state
                                                            .positionList[
                                                                secondIndex]
                                                            .name
                                                        : convertPostionName(
                                                            state
                                                                .positionList[
                                                                    secondIndex]
                                                                .name),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                        image: NetworkImage(
                                                            state
                                                                .positionList[
                                                                    secondIndex]
                                                                .image),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                      : Expanded(flex: 1, child: Container()),
                                  SizedBox(
                                    width: 22,
                                  ),
                                ],
                              ),
                            );
                          },
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        else if (state is ChooseLoading) {
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
                        height: 100,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            child: CircularProgressIndicator(
                              strokeWidth: 7,
                              backgroundColor: AppColor.BlueLight,
                              color: AppColor.BlueMain,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return staffTypeList.isEmpty ? Scaffold(
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
                        height: 100,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              strokeWidth: 7,
                              backgroundColor: AppColor.BlueLight,
                              color: AppColor.BlueMain,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ):Scaffold(
            backgroundColor: AppColor.White,
            body: SingleChildScrollView(
              child: Column(
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
                          height: 25,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: (staffTypeList.length / 2).ceil(),
                          itemBuilder: (context, index) {
                            int firstIndex = index * 2;
                            int secondIndex = firstIndex + 1;
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 22,
                                  ),
                                  Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          openScreen(
                                              context,
                                              ChooseAgeScreen(
                                                staffType:
                                                staffTypeList[firstIndex],
                                              ));
                                        },
                                        child: Container(
                                          height: 160,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFF3F5F7),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(24),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 18,
                                                top: 18,
                                                child: SizedBox(
                                                  child: Text(
                                                    convertPostionName(staffTypeList[
                                                    firstIndex]
                                                        .name) ==
                                                        ""
                                                        ? staffTypeList[
                                                    firstIndex]
                                                        .name
                                                        : convertPostionName(staffTypeList[
                                                    firstIndex]
                                                        .name),
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
                                                  height: 120,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(staffTypeList[firstIndex]
                                                          .image),
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
                                    width: 12,
                                  ),
                                  secondIndex < staffTypeList.length
                                      ? Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          openScreen(
                                              context,
                                              ChooseAgeScreen(
                                                staffType: staffTypeList[
                                                secondIndex],
                                              ));
                                        },
                                        child: Container(
                                          height: 160,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFF3F5F7),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(24),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 18,
                                                top: 18,
                                                child: Text(
                                                  convertPostionName(staffTypeList[
                                                  secondIndex]
                                                      .name) ==
                                                      ""
                                                      ? staffTypeList[
                                                  secondIndex]
                                                      .name
                                                      : convertPostionName(
                                                      staffTypeList[
                                                      secondIndex]
                                                          .name),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily:
                                                    'SF Pro Display',
                                                    fontWeight:
                                                    FontWeight.w400,
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
                                                      image: NetworkImage(
                                                          staffTypeList[
                                                          secondIndex]
                                                              .image),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                      : Expanded(flex: 1, child: Container()),
                                  SizedBox(
                                    width: 22,
                                  ),
                                ],
                              ),
                            );
                          },
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

String convertPostionName(String position) {
  if (position == "Kichik tibbiy hodim") {
    return "Kichik tibbiy\nhodim";
  } else if (position == "Enaga chaqirish") {
    return "Enaga\nchaqirish";
  } else {
    return "";
  }
}
