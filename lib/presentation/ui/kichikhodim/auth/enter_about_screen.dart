import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../animations/custom_animation.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_style.dart';
import '../../../helpers/flushbar.dart';

class SmallDoctorEnterAboutScreen extends StatefulWidget {
  final VoidCallback onNext;

  SmallDoctorEnterAboutScreen({required this.onNext});

  @override
  State<SmallDoctorEnterAboutScreen> createState() => _SmallDoctorEnterAboutScreenState();
}

class _SmallDoctorEnterAboutScreenState extends State<SmallDoctorEnterAboutScreen>  with AutomaticKeepAliveClientMixin{
  String? _selectedGender;
  TextEditingController datetimecontroller = TextEditingController();
  bool _obscureText = true;
  var nameError = "";
  var surnameError = "";
  var adressError="";
  var JshshrError = "";
  var borndateFormatter = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {"#": RegExp(r'[0-9]')}, // Only allows numeric input
    type: MaskAutoCompletionType.lazy, // Format input lazily as user types
  );

  var nameFocus = FocusNode();
  var surnameFocus = FocusNode();
  var jshshrFocus = FocusNode();
  var dateFocus = FocusNode();
  var adressFocus = FocusNode();
  var passwordFocus = FocusNode();
  var repasswordFocus = FocusNode();
  var nameController = TextEditingController();
  var surnameController = TextEditingController();

  var adressController = TextEditingController();
  var jsshrController = TextEditingController();


  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
          child:
          MaterialButton(
            color: AppColor.BlueMain,
            onPressed: () async {
              if (nameController.text.isEmpty) {
                showErrorFlushBar("Ism kiritilmagan !").show(context);
                nameError = "Ism kiritilmagan !";
                setState(() {});
                await Future.delayed(Duration(seconds: 3));
                nameError = "";
                setState(() {});
              } else if (surnameController.text.isEmpty) {
                showErrorFlushBar("Familya kiritilmagan !").show(context);
                surnameError = "Familya kiritilmagan !";
                setState(() {});
                await Future.delayed(Duration(seconds: 3));
                surnameError = "";
                setState(() {});
              }
              else if (jsshrController.text.isEmpty) {
                showErrorFlushBar("JSHSHR  kiritilmagan !").show(context);
                JshshrError = "Jsshr kiritilmagan !";
                setState(() {});
                await Future.delayed(Duration(seconds: 3));
                JshshrError = "";
                setState(() {});
              }
              else if(_selectedGender==null){
                showErrorFlushBar("Jins tanlang").show(context);
              }
              else if (datetimecontroller.text.isEmpty) {
                showErrorFlushBar("Tugulgan Sana kirtilmagan").show(context);
              }
              else if (adressController.text.isEmpty) {
                showErrorFlushBar("Аdress kiritilmagan").show(context);
                adressError="Аdress kiritilmagan !";
                setState(() {});
                await Future.delayed(Duration(seconds: 3));
                adressError="";
              }
              else {
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    "Ismingiz",
                    style: AppStyle.sfproDisplay14w400Black,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  focusNode: nameFocus,
                  autofocus: true,
                  controller: nameController,
                  style: TextStyle(
                    fontFamily: "SfProDisplay",
                    color: AppColor.Black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Kiriting...",
                    errorText: nameError.isEmpty ? null : nameError,
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
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    "Familiyangiz",
                    style: AppStyle.sfproDisplay14w400Black,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  autofocus: true,
                  controller: surnameController,
                  style: TextStyle(
                    fontFamily: "SfProDisplay",
                    color: AppColor.Black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    errorText: surnameError.isEmpty ? null : surnameError,
                    hintText: "Kiriting...",
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
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    "JSHIRni kiriting",
                    style: AppStyle.sfproDisplay14w400Black,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: jsshrController,
                  autofocus: true,
                  style: TextStyle(
                    fontFamily: "SfProDisplay",
                    color: AppColor.Black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    errorText: JshshrError.isEmpty ? null : JshshrError,
                    hintText: "Kiriting...",
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
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    "Jins tanlang",
                    style: AppStyle.sfproDisplay14w400Black,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  // Aligns radio buttons to the start
                  children: [
                    // Option for selecting "Ayol" (Female)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedGender = "Ayol"; // Select Female
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffD9E4F3), width: 1),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedGender = "Ayol"; // Select Female
                                  });
                                },
                                child: Icon(
                                  _selectedGender == "Ayol"
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color: _selectedGender == "Ayol"
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Ayol",
                                style: AppStyle.sfproDisplay18Black
                                    .copyWith(fontSize: 16),
                              ), // Label for Female
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 13), // Adds space between the two options
                    // Option for selecting "Erkak" (Male)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedGender = "Erkak"; // Select Male
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Color(0xffD9E4F3), width: 1),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedGender = "Erkak"; // Select Male
                                  });
                                },
                                child: Icon(
                                  _selectedGender == "Erkak"
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color: _selectedGender == "Erkak"
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Erkak",
                                style: AppStyle.sfproDisplay18Black
                                    .copyWith(fontSize: 16),
                              ), // Label for Male
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),


          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    "Tugilgan sana",
                    style: AppStyle.sfproDisplay14w400Black,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: datetimecontroller,
                  style: TextStyle(
                    fontFamily: "SfProDisplay",
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  inputFormatters: [borndateFormatter],
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range, color: Colors.black),
                    hintText: "25.08.1998",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
                      borderSide: BorderSide(
                        color: AppColor.BlueMain, // Change this to focus color
                      ),
                    ),
                  ),
                  onTap: () =>
                      _selectDate(context), // Opens the date picker when tapped
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    "Doimiy manzil",
                    style: AppStyle.sfproDisplay14w400Black,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: adressController,
                  autofocus: true,
                  style: TextStyle(
                    fontFamily: "SfProDisplay",
                    color: AppColor.Black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Kiriting...",
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
          SizedBox(
            height: 24,
          ),
        ],
      )),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        datetimecontroller.text =
            "${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}";
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
