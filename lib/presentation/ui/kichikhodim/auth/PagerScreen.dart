import 'package:doc_app/core/models/requests/auth/staff_specialization.dart';
import 'package:doc_app/core/models/responses/choose/staff_type.dart';
import 'package:doc_app/presentation/helpers/flushbar.dart';
import 'package:doc_app/presentation/ui/kichikhodim/auth/enter_about_screen.dart';
import 'package:doc_app/presentation/ui/kichikhodim/auth/finished_success_dialog.dart';
import 'package:doc_app/utils/reg_data.dart';
import 'package:doc_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../../../../bloc/register/register_bloc.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_style.dart';
import '../../../../core/models/fake/DataModel.dart';
import '../../../../core/models/fake/Document.dart';
import '../../../../core/models/requests/auth/staff_request.dart';
import '../../../../core/models/responses/choose/choose_specalization_response.dart';
import 'enter_extra_info_screen.dart';
import 'enter_profession_screen.dart';

class AuthPagerScreen extends StatefulWidget {
  final List<Service> selectedServices;
  final StaffType staffType;

  const AuthPagerScreen(
      {super.key, required this.selectedServices, required this.staffType});

  @override
  State<AuthPagerScreen> createState() => _AuthPagerScreenState();
}

class _AuthPagerScreenState extends State<AuthPagerScreen> {
  int _current = 0;
  PageController _controller = PageController(initialPage: 0);
  late RegisterBloc registerBloc;
  bool isLoading = false;

  Future<bool> _onWillPop() async {
    if (_current > 0) {
      _goToPage(_current - 1); // Oldingi sahifaga o'tish
      return false; // Ilova yopilmaydi
    }
    return true; // Ilova yopiladi
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterFailure) {
            isLoading = false;
            setState(() {

            });
            showErrorFlushBar(state.error).show(context);
          }
          if (state is RegisterSuccess) {
            isLoading = false;
            setState(() {

            });
            showFinishedSuccessDialog(context);
            print("Sucess"+state.response.toString());

          } else if (state is RegisterLoading) {
            isLoading = true;
            setState(() {});
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: _current == 0
                  ? null
                  : IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        _goToPage(_current - 1); // Oldingi sahifaga o'tish
                      },
                    ),
              backgroundColor: AppColor.White,
              elevation: Device.get().isAndroid ? 0.5 : 0.4,
              title: Text(
                'Ma’lumotlarni to’ldiring.',
                style: AppStyle.sfproDisplay18Black.copyWith(
                  fontSize: 21,
                  height: 1.20,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Iltimos barcha kerakli ma’lumotlarni to’ldiring!',
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
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? AppColor.BlueMain
                                  : AppColor.Gray2,
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              centerTitle: true,
            ),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              children: [
                EnterAboutScreen(onNext: () => _goToPage(1)),
                EnterExtraInfoScreen(onNext: () => _goToPage(2)),
                EnterProfessionScreen(
                    isLoading: isLoading,
                    onNext: ({
                      required String experience,
                      required List<DataModel> datas,
                      required List<FakeDocument> otherDocs,
                    }) {
                      var selecteds = [];
                      for (var element in widget.selectedServices) {
                        selecteds.add(element.id);
                      }
                      var userinfo = RegData().asa;
                      var staffRequest = StaffRequest(
                          type: widget.staffType.id,
                          firstName: userinfo!.name.toString(),
                          lastName: userinfo!.surname.toString(),
                          phone: convertPhoneNumber(phoneNumber),
                          jshshr: userinfo!.jsshr.toString(),
                          address: userinfo.hometown.toString(),
                          birthday: convertToDashedDate(userinfo.borndate.toString()),
                          gender: userinfo.gender.toString(),
                          about: RegData().selfDescription!,
                          acceptedAge: RegData().ageResponse!.id.toString(),
                          otherDatas:
                              otherDocs.map((e) => e.toOtherData()).toList(),
                          staffSpecializations: [
                            StaffSpecialization(
                                specialization: widget.staffType.id,
                                selectedservices: [1, 2, 3],
                                experience: int.parse(experience),
                                educations:
                                    datas.map((e) => e.toEducation()).toList())
                          ]);
                      registerBloc.add(RegisterButtonPressed(
                        staffRequest: staffRequest,
                      ));
                    }),
              ],
            ),
          );
        },
      ),
    );
  }

  void _goToPage(int index) {
    setState(() {
      _current = index;
      _controller.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}
