import 'dart:io';

import 'package:doc_app/constants/app_color.dart';
import 'package:doc_app/constants/app_images.dart';
import 'package:doc_app/core/models/fake/DataModel.dart';
import 'package:doc_app/core/models/fake/Document.dart';
import 'package:doc_app/presentation/ui/kichikhodim/auth/add_other_documents_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:custom_pop_up_menu_fork/custom_pop_up_menu.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../animations/custom_animation.dart';
import '../../../../constants/app_style.dart';
import '../../../helpers/flushbar.dart';
import 'add_data_dialog.dart';
import 'edit_data_dialog.dart';
import 'edit_other_documents.dart';
import 'finished_success_dialog.dart';

class EnterProfessionScreen extends StatefulWidget {
  final Function(
      {required String experience,
      required List<DataModel> datas,
      required List<FakeDocument> otherDocs}) onNext;
  final bool isLoading; // Accept loading state

  const EnterProfessionScreen(
      {super.key, required this.onNext, required this.isLoading});

  @override
  State<EnterProfessionScreen> createState() => _EnterProfessionScreenState();
}

class _EnterProfessionScreenState extends State<EnterProfessionScreen> {
  var experiencecontroller = TextEditingController();
  var experienceError = "";
  var datas = <DataModel>[];
  var otherDocs = <FakeDocument>[];

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
              if (experiencecontroller.text.isEmpty) {
                showErrorFlushBar("Ish tajribasi kiritilmagan !").show(context);
                experienceError = "Ish tajribasi kiritilmagan !";
                setState(() {});
                await Future.delayed(Duration(seconds: 3));
                experienceError = "";
                setState(() {});
              } else if (datas.isEmpty) {
                showErrorFlushBar("Malumotlar qoshilmagan").show(context);
              } else {
                widget.onNext(
                  experience: experiencecontroller.text,
                  datas: datas,
                  otherDocs: otherDocs,
                );
              }
            },
            elevation: 0,
            highlightElevation: 0,
            focusElevation: 0,
            textColor: AppColor.White,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: widget.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColor.White,
                    ),
                  )
                : Row(
                    children: [
                      Spacer(),
                      Text("Yakunlash"),
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
      backgroundColor: AppColor.Gray1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 14,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 28,
                      alignment: Alignment.center,
                      // Ichidagi Row markazga joylashadi
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.capilnisa,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Kichik tibbiyot xodimi ma’lumotlari',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Text(
                            "Ushbu mutaxassislig bo’yicha tajribangiz?",
                            style: AppStyle.sfproDisplay14w400Black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          autofocus: true,
                          controller: experiencecontroller,
                          style: TextStyle(
                            fontFamily: "SfProDisplay",
                            color: AppColor.Black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixIcon: Container(
                              alignment: Alignment.centerRight,
                              height: 40,
                              width: 20,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Yil',
                                style: TextStyle(
                                  color: AppColor.Gray5,
                                  fontSize: 17,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            hintText: "Kiriting...",
                            errorText: experienceError.isEmpty
                                ? null
                                : experienceError,
                            hintStyle:
                                TextStyle(color: AppColor.Gray3, fontSize: 14),
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
                                color: AppColor
                                    .BlueMain, // Change this to focus color
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.5,
                      decoration: BoxDecoration(
                        color: AppColor.Gray1,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Ma’lumotingiz',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: datas.length,
                        itemBuilder: (context, index) {
                          final CustomPopupMenuController menuController =
                              CustomPopupMenuController();

                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 13,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        datas[index].studytype,
                                        style: TextStyle(
                                          color: AppColor.BlueMain,
                                          fontSize: 14,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Spacer(),
                                      CustomPopupMenu(
                                          menuBuilder: () {
                                            return Container(
                                              width: 250,
                                              decoration: BoxDecoration(
                                                color: AppColor.White,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    height: 14,
                                                  ),
                                                  _buildMenuItem(
                                                      context: context,
                                                      icon: AppImages.editicon,
                                                      text: "Tahrirlash",
                                                      ontap: (image) {
                                                        if (image ==
                                                            AppImages
                                                                .editicon) {
                                                          menuController
                                                              .hideMenu();
                                                          editDataDialog(
                                                            context,
                                                            datas[index],
                                                            (datamodel) {
                                                              datas[index] =
                                                                  datamodel;
                                                              setState(() {});
                                                            },
                                                          );
                                                        }
                                                      },
                                                      background:
                                                          AppColor.Gray1),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  _buildMenuItem(
                                                      context: context,
                                                      ontap: (image) {
                                                        if (image ==
                                                            AppImages
                                                                .deleteicon) {
                                                          datas.removeAt(index);
                                                          setState(() {});
                                                        }
                                                      },
                                                      icon:
                                                          AppImages.deleteicon,
                                                      text: "O’chirish",
                                                      background:
                                                          AppColor.Gray1),
                                                  SizedBox(
                                                    height: 14,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          controller: menuController,
                                          showArrow: false,
                                          pressType: PressType.singleClick,
                                          verticalMargin: 0,
                                          child: Icon(
                                            Icons.more_vert,
                                            color: Colors.black,
                                            size: 24,
                                          )),
                                    ],
                                  ),
                                  Text(
                                    datas[index].universityName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0xFFE6F2FF)),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${datas[index].startyear} - ${datas[index].endyear}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'SF Pro Display',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 1.5,
                                    decoration: BoxDecoration(
                                      color: AppColor.Gray1,
                                    ),
                                  ),
                                  Container(
                                    height: 85,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    child: ListView.builder(
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.file(
                                              datas[index].imgs[i],
                                              height: 85,
                                              width: 120,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: datas[index].imgs.length,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: datas.length == 0 ? 0 : 18,
                    ),
                    Container(
                      width: double.infinity,
                      height: Device.get().isAndroid ? 45 : 50,
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
                              Icon(
                                size: 20,
                                Icons.add,
                                color: AppColor.BlueMain,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Ma’lumot qo’shish',
                                style: TextStyle(
                                  color: AppColor.BlueMain,
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        onPressed: () {
                          showAddDataDialog(context, (dataModel) {
                            print(dataModel.toString());
                            datas.add(dataModel);
                            print(datas.toString());
                            setState(() {});
                          });
                        },
                        color: AppColor.BlueLight,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Boshqa hujjatlar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: otherDocs.length,
                      itemBuilder: (context, index) {
                        final CustomPopupMenuController menuController =
                            CustomPopupMenuController();

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 13,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      otherDocs[index].name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacer(),
                                    CustomPopupMenu(
                                        menuBuilder: () {
                                          return Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: AppColor.White,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  height: 14,
                                                ),
                                                _buildMenuItem(
                                                    context: context,
                                                    icon: AppImages.editicon,
                                                    text: "Tahrirlash",
                                                    ontap: (image) {
                                                      if (image ==
                                                          AppImages.editicon) {
                                                        menuController
                                                            .hideMenu();
                                                        editOtherDocsDialog(
                                                            context, (v) {
                                                          otherDocs[index] = v;
                                                          setState(() {});
                                                        }, otherDocs[index]);
                                                      }
                                                    },
                                                    background: AppColor.Gray1),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                _buildMenuItem(
                                                    context: context,
                                                    ontap: (image) {
                                                      if (image ==
                                                          AppImages
                                                              .deleteicon) {
                                                        otherDocs
                                                            .removeAt(index);
                                                        setState(() {});
                                                      }
                                                    },
                                                    icon: AppImages.deleteicon,
                                                    text: "O’chirish",
                                                    background: AppColor.Gray1),
                                                SizedBox(
                                                  height: 14,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        controller: menuController,
                                        showArrow: false,
                                        pressType: PressType.singleClick,
                                        verticalMargin: 0,
                                        child: Icon(
                                          Icons.more_vert,
                                          color: Colors.black,
                                          size: 24,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFFE6F2FF)),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${otherDocs[index].startDate} - ${otherDocs[index].endDate}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    color: AppColor.Gray1,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    otherDocs[index].image,
                                    height: 85,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: otherDocs.length == 0 ? 0 : 18,
                  ),
                  Container(
                    width: double.infinity,
                    height: Device.get().isAndroid ? 45 : 50,
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
                            Icon(
                              size: 20,
                              Icons.add,
                              color: AppColor.BlueMain,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Ma’lumot qo’shish',
                              style: TextStyle(
                                color: AppColor.BlueMain,
                                fontSize: 14,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      onPressed: () {
                        showAddOtherDialog(context, (da) {
                          otherDocs.add(da);
                          setState(() {});
                        });
                      },
                      color: AppColor.BlueLight,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required String icon,
    required Function(String image) ontap,
    required String text,
    required Color background,
  }) {
    return InkWell(
      onTap: () {
        ontap(icon);
      },
      borderRadius: BorderRadius.circular(22),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: 14,
              ),
              SvgPicture.asset(
                icon,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 1.20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
