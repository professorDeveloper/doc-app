import 'dart:io';

import 'package:doc_app/constants/app_images.dart';
import 'package:doc_app/core/models/fake/Document.dart';
import 'package:doc_app/navigator/navigator.dart';
import 'package:doc_app/presentation/helpers/flushbar.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../animations/custom_animation.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_style.dart';
import '../../../../core/models/fake/DataModel.dart';
import '../../../helpers/image_picker_dialog.dart';

File img = File("");

void editOtherDocsDialog(BuildContext context, Function(FakeDocument) document,FakeDocument edditingDocument) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    backgroundColor: Colors.white,
    context: context,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    isScrollControlled: true,
    builder: (context) => EditOtherDocumentsView(
      dataModel:document,
      edittingDatamodel: edditingDocument,
    ),

  );
}

class EditOtherDocumentsView extends StatefulWidget {
 final FakeDocument edittingDatamodel;
  final Function(FakeDocument) dataModel;

   const EditOtherDocumentsView({super.key,required this.edittingDatamodel,required this.dataModel});

  @override
  State<EditOtherDocumentsView> createState() => _AddOtherDocumentsViewState();
}

class _AddOtherDocumentsViewState extends State<EditOtherDocumentsView> {
  TextEditingController documentNameController = TextEditingController();
  TextEditingController documentstartdateController = TextEditingController();
  TextEditingController documentenddateController = TextEditingController();
  String docoumentError = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    documentNameController.text = widget.edittingDatamodel.name;
    documentstartdateController.text = widget.edittingDatamodel.startDate;
    documentenddateController.text = widget.edittingDatamodel.endDate;
    img = widget.edittingDatamodel.image;
  }
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.Gray1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Row(
                          children: [
                            Text(
                              'Boshqa hujjatlar',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    color: AppColor.White,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Text(
                            "Hujjat nomi",
                            style: AppStyle.sfproDisplay14w400Black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          autofocus: true,
                          controller: documentNameController,
                          style: TextStyle(
                            fontFamily: "SfProDisplay",
                            color: AppColor.Black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Kiriting...",
                            errorText:
                                docoumentError.isEmpty ? null : docoumentError,
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
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.5,
                      decoration: BoxDecoration(color: AppColor.Gray1),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Hujjat qabul qilingan davr',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Text(
                                  "Yildan",
                                  style: AppStyle.sfproDisplay14w400Black,
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                autofocus: true,
                                inputFormatters: [studydateformatter],
                                style: TextStyle(
                                  fontFamily: "SfProDisplay",
                                  color: AppColor.Black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                controller: documentstartdateController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "2025",
                                  prefixIcon: Icon(
                                    Icons.date_range,
                                    color: AppColor.Black,
                                  ),
                                  hintStyle: TextStyle(
                                      color: AppColor.Gray3, fontSize: 14),
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
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Text(
                                  "Yilgacha",
                                  style: AppStyle.sfproDisplay14w400Black,
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                controller: documentenddateController,
                                inputFormatters: [studydateformatter],
                                autofocus: true,
                                style: TextStyle(
                                  fontFamily: "SfProDisplay",
                                  color: AppColor.Black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "2027",
                                  prefixIcon: Icon(
                                    Icons.date_range,
                                    color: AppColor.Black,
                                  ),
                                  hintStyle: TextStyle(
                                      color: AppColor.Gray3, fontSize: 14),
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.5,
                      decoration: BoxDecoration(color: AppColor.Gray1),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Hujjat rasmi',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        img.path.isEmpty
                            ? MaterialButton(
                                onPressed: () {
                                  showImagePickerDialog(
                                      context: context,
                                      onImagePicked: (image) {
                                        setState(() {
                                          img = image;
                                        });
                                      });
                                },
                                elevation: 0,
                                highlightElevation: 0,
                                focusElevation: 0,
                                color: AppColor.BlueLight,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                minWidth: 120,
                                height: 85,
                                child: SvgPicture.asset(
                                  AppImages.addimage,
                                  height: 28,
                                  width: 28,
                                ))
                            : InkWell(
                                onTap: () {
                                  showImagePickerDialog(
                                      context: context,
                                      onImagePicked: (image) {
                                        setState(() {
                                          img = image;
                                        });
                                      });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    img,
                                    height: 85,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          img.path.isEmpty ? 'Rasm tanlash' : '1-Rasm',
                          style: TextStyle(
                            color: Color(0xFF586E8A),
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              CustomAnimationsSlide(
                direction: FadeSlideDirection.btt,
                duration: 0.8,
                child: Container(
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
                            'Saqlash',
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
                      if (documentNameController.text.isEmpty) {
                        showErrorFlushBar("Hujjat nomi kiritilmagan !")
                            .show(context);
                        docoumentError = "Hujjat nomi kiritilmagan !";
                        setState(() {});
                        await Future.delayed(Duration(seconds: 3));
                        docoumentError = "";
                        setState(() {});
                      } else if (documentstartdateController.text.isEmpty) {
                        showErrorFlushBar("Yil kiritilmagan !").show(context);
                      } else if (documentenddateController.text.isEmpty) {
                        showErrorFlushBar("Yil kiritilmagan !").show(context);
                      } else if (img.path.isEmpty) {
                        showErrorFlushBar("Hujjat rasmi kiritilmagan !")
                            .show(context);
                      } else {
                        widget.dataModel(FakeDocument(
                            name: documentNameController.text,
                            image: img,
                            startDate: documentstartdateController.text,
                            endDate: documentenddateController.text));
                        img = File("");
                        closeScreen(context);
                      }
                    },
                    color: AppColor.BlueMain,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}

var studydateformatter = MaskTextInputFormatter(
  mask: '####',
  filter: {"#": RegExp(r'[0-9]')}, // Only allows numeric input
  type: MaskAutoCompletionType.lazy, // Format input lazily as user types
);
