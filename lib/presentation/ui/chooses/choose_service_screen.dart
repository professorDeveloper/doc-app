import 'package:doc_app/core/models/responses/choose/choose_specalization_response.dart';
import 'package:doc_app/core/models/responses/choose/staff_type.dart';
import 'package:doc_app/presentation/ui/kichikhodim/auth/PagerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/svg.dart';

import '../../../animations/custom_animation.dart';
import '../../../bloc/choose/choose_bloc.dart';
import '../../../constants/app_color.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_style.dart';
import '../../../navigator/navigator.dart';
import '../../../utils/reg_data.dart';
import '../kichikhodim/orders/add_services_dialog.dart';

class ChooseServiceScreen extends StatefulWidget {
  final StaffType staffType;

  const ChooseServiceScreen({super.key, required this.staffType});

  @override
  State<ChooseServiceScreen> createState() => _ChooseServiceScreenState();
}

class _ChooseServiceScreenState extends State<ChooseServiceScreen> {
  late ChooseBloc chooseBloc;

  List<Service> selectedServices = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chooseBloc = BlocProvider.of<ChooseBloc>(context);
    chooseBloc.add(FetchChooseSpecializationEvent(staffType: widget.staffType));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChooseBloc, ChooseState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ChooseSpecializationSuccessState) {
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
                    onPressed: selectedServices.isEmpty
                        ? null
                        : () {
                            for (var value in selectedServices) {
                              print(value.toString());
                            }
                            // showAddServicesDialog(context);
                            openScreen(
                                context,
                                AuthPagerScreen(
                                  selectedServices: selectedServices,
                                  staffType: widget.staffType,
                                ));
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
              itemCount: state.specializationList[0].services.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        if (selectedServices.contains(
                            state.specializationList[0].services[index])) {
                          selectedServices.remove(
                              state.specializationList[0].services[index]);
                        } else {
                          selectedServices
                              .add(state.specializationList[0].services[index]);
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SvgPicture.asset(
                              AppImages.tibbiyhodimserviceicon,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                                maxLines: 1,
                                "${state.specializationList[0].services[index].name}",
                                style: TextStyle(fontSize: 16)),
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            value: selectedServices.contains(
                                state.specializationList[0].services[index]),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedServices.add(state
                                      .specializationList[0].services[index]);
                                } else {
                                  selectedServices.remove(state
                                      .specializationList[0].services[index]);
                                }
                              });
                            },
                            activeColor: AppColor.BlueMain,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
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
                    onPressed: selectedServices.isEmpty
                        ? null
                        : () {
                            for (var value in selectedServices) {
                              print(value.toString());
                            }
                            showAddServicesDialog(context);
                            // openScreen(context, SmallDoctorPagerScreen());
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
            body: Center(
              child: CircularProgressIndicator(
                color: AppColor.BlueMain,
              ),
            ),
          );
        }
      },
    );
  }
}
