import 'package:doc_app/animations/custom_animation.dart';
import 'package:doc_app/constants/app_images.dart';
import 'package:doc_app/core/models/responses/choose/choose_response.dart';
import 'package:doc_app/core/models/responses/choose/staff_type.dart';
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
  final StaffType staffType;

  const ChooseAgeScreen({Key? key, required this.staffType}) : super(key: key);

  @override
  State<ChooseAgeScreen> createState() => _ChooseAgeScreenState();
}

class _ChooseAgeScreenState extends State<ChooseAgeScreen> {
  int? _selectedValue = -1;
  late ChooseBloc bloc;
  List<AgeResponse> cachedAgeList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<ChooseBloc>(context);
    bloc.add(FetchChooseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChooseBloc, ChooseState>(
      listener: (context, state) {
        if (state is ChooseSuccessState) {
          cachedAgeList = state.ageList;
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
                      onPressed: _selectedValue == -1
                          ? null
                          : () {
                              var regdata = RegData();
                              regdata.setAgeResponse(
                                  state.ageList[_selectedValue!]);
                              openScreen(
                                  context,
                                  ChooseServiceScreen(
                                      staffType: widget.staffType));
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.ageList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedValue =
                                  index; // Update the selected index
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 9),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: SvgPicture.asset(
                                    filterImage(cachedAgeList[index].id),
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    state.ageList[index].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      // Text color for selected item
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Radio<int>(
                                  value: index, // Store index as value
                                  groupValue: _selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValue = value;
                                    });
                                  },
                                  activeColor: AppColor.BlueMain,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ]));
        } else {
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
                      onPressed: _selectedValue == -1
                          ? null
                          : () {
                              var regdata = RegData();
                              regdata.setAgeResponse(
                                  cachedAgeList[_selectedValue!]);
                              openScreen(
                                  context,
                                  ChooseServiceScreen(
                                      staffType: widget.staffType));
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cachedAgeList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedValue =
                                  index; // Update the selected index
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 9),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: SvgPicture.asset(
                                    filterImage(cachedAgeList[index].id),
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    cachedAgeList[index].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      // Text color for selected item
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Radio<int>(
                                  value: index, // Store index as value
                                  groupValue: _selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValue = value;
                                    });
                                  },
                                  activeColor: AppColor.BlueMain,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ]));
        }
      },
    );
  }

  String filterImage(String id) {
    if (id == "both")
      return AppImages.bothchoose;
    else if (id == "adults")
      return AppImages.bigchoose;
    else
      return AppImages.youngchoose;
  }
}
