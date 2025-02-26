import 'dart:io';

import 'package:doc_app/constants/app_images.dart';
import 'package:doc_app/core/models/fake/DataModel.dart';
import 'package:doc_app/core/models/responses/profession/education_level_model.dart';
import 'package:doc_app/navigator/navigator.dart';
import 'package:doc_app/presentation/ui/kichikhodim/auth/add_other_documents_dialog.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../animations/custom_animation.dart';
import '../../../../bloc/profession/profession_bloc.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_style.dart';
import '../../../helpers/flushbar.dart';
import '../../../helpers/image_picker_dialog.dart';


class AddDataDialogView extends StatefulWidget {
  final Function(DataModel) dataModel;

  const AddDataDialogView({super.key, required this.dataModel});

  @override
  State<AddDataDialogView> createState() => _AddDataDialogViewState();
}

class _AddDataDialogViewState extends State<AddDataDialogView> {
  List<File> imgs = [];

  var universityNameController = TextEditingController();
  var universtyTypeController = TextEditingController();
  List<EducationLevel> dropdownItems = [];
  late ProfessionBloc bloc;
  bool isLoading = false;
  String? selectedValue;
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<ProfessionBloc>(context);
    bloc.add(GetProfessions());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    imgs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfessionBloc, ProfessionState>(
      listener: (context, state) {
        if (state is ProfessionLoaded) {
          selectedValue = state.ageList[0].name;
        }
      },
      builder: (context, state) {
        if (state is ProfessionLoaded) {
          dropdownItems = state.ageList;
          return FractionallySizedBox(
            heightFactor: Device.get().isAndroid ? 0.92 : 0.92,
            child: Container(
              color: AppColor.Gray1,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Ma’lumot qo’shish',
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
                          Text(
                            '1.Ma’lumot',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Text(
                                  "Universitet nomi",
                                  style: AppStyle.sfproDisplay14w400Black,
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                autofocus: true,
                                controller: universityNameController,
                                style: TextStyle(
                                  fontFamily: "SfProDisplay",
                                  color: AppColor.Black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: "Kiriting...",
                                  errorText: universityError.isEmpty
                                      ? null
                                      : universityError,
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
                          DropdownButtonFormField<String>(
                            value: selectedValue, // Tanlangan qiymat
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: dropdownItems.map((EducationLevel item) {
                              return DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontFamily: "SfProDisplay",
                                    color: AppColor.Black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor.Gray,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColor.Gray,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColor.Gray,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColor.BlueMain,
                                ),
                              ),
                            ),
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
                            'O’qigan yilingiz',
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Text(
                                        "Yildan",
                                        style: AppStyle.sfproDisplay14w400Black,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    TextField(
                                      autofocus: true,
                                      controller: startDateController,
                                      inputFormatters: [studydateformatter],
                                      style: TextStyle(
                                        fontFamily: "SfProDisplay",
                                        color: AppColor.Black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "2025",
                                        prefixIcon: Icon(
                                          Icons.date_range,
                                          color: AppColor.Black,
                                        ),
                                        errorText: startdateError.isEmpty
                                            ? null
                                            : startdateError,
                                        hintStyle: TextStyle(
                                            color: AppColor.Gray3,
                                            fontSize: 14),
                                        filled: true,
                                        fillColor: AppColor.Gray,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: AppColor.Gray,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: AppColor.Gray,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Text(
                                        "Yilgacha",
                                        style: AppStyle.sfproDisplay14w400Black,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    TextField(
                                      inputFormatters: [studydateformatter],
                                      controller: endDateController,
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
                                        errorText: endDateError.isEmpty
                                            ? null
                                            : endDateError,
                                        hintStyle: TextStyle(
                                            color: AppColor.Gray3,
                                            fontSize: 14),
                                        filled: true,
                                        fillColor: AppColor.Gray,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: AppColor.Gray,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: AppColor.Gray,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Diplom rasmi',
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
                              imgs.isEmpty
                                  ? MaterialButton(
                                      onPressed: () {
                                        showImagePickerDialog(
                                            context: context,
                                            onImagePicked: (image) {
                                              setState(() {
                                                imgs.add(image);
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
                                  : Container(
                                      height: 130,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: imgs.length + 1,
                                        // Oxirida +1 bo'ladi
                                        itemBuilder: (context, index) {
                                          if (index == imgs.length) {
                                            // Oxirgi elementdan keyin MaterialButton
                                            return Container(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Column(
                                                children: [
                                                  MaterialButton(
                                                    onPressed: () {
                                                      showImagePickerDialog(
                                                        context: context,
                                                        onImagePicked: (image) {
                                                          setState(() {
                                                            imgs.add(image);
                                                          });
                                                        },
                                                      );
                                                    },
                                                    elevation: 0,
                                                    highlightElevation: 0,
                                                    focusElevation: 0,
                                                    color: AppColor.BlueLight,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    minWidth: 120,
                                                    height: 85,
                                                    child: SvgPicture.asset(
                                                      AppImages.addimage,
                                                      height: 28,
                                                      width: 28,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    "Rasm qo`shish",
                                                    style: TextStyle(
                                                      color: Color(0xFF586E8A),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.40,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            // Oddiy rasm itemi
                                            return Container(
                                              height: 150,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {},
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        child: Image.file(
                                                          imgs[index],
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
                                                        "${index + 1}- Rasm",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF586E8A),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.40,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                        },
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
                      height: 25,
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
                          onPressed: () {
                            if (universityNameController.text.isEmpty) {
                              showErrorFlushBar("Fakultet nomi kiritilmagan !")
                                  .show(context);
                              universityError = "Fakultet nomi kiritilmagan !";
                              setState(() {});
                              Future.delayed(Duration(seconds: 3))
                                  .then((value) {
                                universityError = "";
                                setState(() {});
                              });
                            } else if (startDateController.text.isEmpty) {
                              showErrorFlushBar(
                                      "Boshlanish yili kiritilmagan !")
                                  .show(context);
                            } else if (endDateController.text.isEmpty) {
                              showErrorFlushBar("Tugash yili kiritilmagan !")
                                  .show(context);
                            } else if (imgs.isEmpty) {
                              showErrorFlushBar("Rasm kiritilmagan !")
                                  .show(context);
                            } else {
                              DataModel newData = DataModel(
                                universityName: universityNameController.text,
                                studytype: selectedValue.toString(),
                                startyear: startDateController.text,
                                endyear: endDateController.text,
                                imgs: List<File>.from(imgs), // Deep copy for imgs list
                              );

                              widget.dataModel(newData);
                              print(newData.toString());
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
        } else if (state is ProfessionLoading) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
            child: FractionallySizedBox(
                heightFactor: 0.95,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColor.BlueMain,
                  ),
                )),
          );
        }
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
          child: FractionallySizedBox(
              heightFactor: 0.91,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.BlueMain,
                ),
              )),
        );
      },
    );
  }
}

var typeController = TextEditingController();
var universityError = "";
var startdateError = "";
var endDateError = "";
var studydateformatter = MaskTextInputFormatter(
  mask: '####',
  filter: {"#": RegExp(r'[0-9]')}, // Only allows numeric input
  type: MaskAutoCompletionType.lazy, // Format input lazily as user types
);

void showAddDataDialog(BuildContext context, Function(DataModel) dataModel) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    backgroundColor: Colors.white,
    context: context,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    isScrollControlled: true,
    builder: (context) => AddDataDialogView(
      dataModel: (datamodel) {
        dataModel(datamodel);
        closeScreen(context);
      },
    ),
  );
}
