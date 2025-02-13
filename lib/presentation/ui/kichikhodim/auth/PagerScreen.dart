import 'package:doc_app/presentation/ui/kichikhodim/auth/enter_about_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_style.dart';
import 'enter_extra_info_screen.dart';
import 'enter_profession_screen.dart';

class SmallDoctorPagerScreen extends StatefulWidget {
  const SmallDoctorPagerScreen({super.key});

  @override
  State<SmallDoctorPagerScreen> createState() => _SmallDoctorPagerScreenState();
}

class _SmallDoctorPagerScreenState extends State<SmallDoctorPagerScreen> {
  int _current = 0;
  PageController _controller = PageController(initialPage: 0);

  Future<bool> _onWillPop() async {
    if (_current > 0) {
      _goToPage(_current - 1); // Oldingi sahifaga o'tish
      return false; // Ilova yopilmaydi
    }
    return true; // Ilova yopiladi
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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

            SmallDoctorEnterAboutScreen(onNext: () => _goToPage(1)),
            SmallDoctorEnterExtraInfoScreen(onNext: () => _goToPage(2)),
            SmallDoctorEnterProfessionScreen(),



          ],
        ),
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
