import 'dart:async';

import 'package:doc_app/presentation/ui/kichikhodim/orders/active_order_screen.dart';
import 'package:doc_app/presentation/ui/kichikhodim/orders/proccessing_order_screen.dart';
import 'package:doc_app/presentation/ui/kichikhodim/orders/start_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/app_style.dart';
import 'finished_order_screen.dart';

class OrderPagerScreen extends StatefulWidget {
  const OrderPagerScreen({super.key});

  @override
  State<OrderPagerScreen> createState() => _OrderPagerScreenState();
}

class _OrderPagerScreenState extends State<OrderPagerScreen> {
  int seconds = 0; // 00:12 dan boshlanadi
  int _current = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  PageController _controller = PageController(initialPage: 0);

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

  Future<bool> _onWillPop() async {
    if (_current > 0) {
      _goToPage(_current - 1); // Oldingi sahifaga o'tish
      return false; // Ilova yopilmaydi
    }
    return true; // Ilova yopiladi
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++; // Har 1 sekundda +1
      });
    });
  }

  String formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int sec = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel(); // Timer'ni to‘xtatish
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBarByCurrent(_current),
      appBar: AppBar(
        backgroundColor: AppColor.White,
        toolbarHeight: 85,
        elevation: 0.4,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu, color: Colors.black),
        //   onPressed: () {
        //     scaffoldKey.currentState?.openDrawer();
        //   },
        // ),
        title: Column(
          children: [
            Text(
              'Aktiv buyurtma',
              style: AppStyle.sfproDisplay16Black,
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: AppColor.Black,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              child: Text(
                formatTime(seconds), // Vaqtni format qilib chiqarish
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  height: 1.40,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: PageView(


        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          ActiveOrderScreen(),
          StartOrderScreen(),
          ProccessingOrderScreen(),
        ],
      ),
    );
  }
  Widget bottomBarByCurrent(int current){
    if(current==0){
      return   Container(
        decoration: BoxDecoration(
          color: AppColor.White,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    'Bepul kutish',
                    style: TextStyle(
                      color: Color(0xFF8F96A0),
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '02:59',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 1.40,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    'Umumiy summa',
                    style: TextStyle(
                      color: Color(0xFF8F96A0),
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '100 000 сум',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: SwipeButton(
                      thumb: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      activeThumbColor: AppColor.BlueMain,
                      activeTrackColor: AppColor.BlueLight,
                      inactiveThumbColor: AppColor.White,
                      inactiveTrackColor: AppColor.Gray2,
                      onSwipe: () {
                        _goToPage(_current + 1);
                        // Perform any action you want after swipe
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Man keldim',
                            style: TextStyle(
                              color: Color(0xFF8CA6C1),
                              fontSize: 16,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(AppImages.arrows)
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                      minWidth: 50,
                      elevation: 0,
                      height: 50,
                      focusElevation: 0,
                      shape: CircleBorder(),
                      highlightElevation: 0,
                      color: AppColor.BlueLight,
                      onPressed: () {},
                      child: Icon(
                        Icons.phone,
                        color: AppColor.BlueMain,
                      ))
                ],
              ),
              SizedBox(height: 15,),
              Text(
                'Buyurtmani bekor qilish',
                style: TextStyle(
                  color: Color(0xFFEE0B0B),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 1.40,
                ),
              ),

              SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      );

    }
    else if(current==1){
      return   Container(
        decoration: BoxDecoration(
          color: AppColor.White,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    'Bepul kutish',
                    style: TextStyle(
                      color: Color(0xFF8F96A0),
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '02:59',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 1.40,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    'Umumiy summa',
                    style: TextStyle(
                      color: Color(0xFF8F96A0),
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '100 000 сум',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: SwipeButton(
                      thumb: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      activeThumbColor: AppColor.BlueMain,
                      activeTrackColor: AppColor.BlueLight,
                      inactiveThumbColor: AppColor.White,
                      inactiveTrackColor: AppColor.Gray2,
                      onSwipe: () {
                        _goToPage(_current + 1);
                        // Perform any action you want after swipe
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ko’rikni boshlashim',
                            style: TextStyle(
                              color: Color(0xFF8CA6C1),
                              fontSize: 16,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(AppImages.arrows)
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                      minWidth: 50,
                      elevation: 0,
                      height: 50,
                      focusElevation: 0,
                      shape: CircleBorder(),
                      highlightElevation: 0,
                      color: AppColor.BlueLight,
                      onPressed: () {},
                      child: Icon(
                        Icons.phone,
                        color: AppColor.BlueMain,
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    }
    return  Container(
      decoration: BoxDecoration(
        color: AppColor.White,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  'Umumiy summa',
                  style: TextStyle(
                    color: Color(0xFF8F96A0),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                  ),
                ),
                Spacer(),
                Text(
                  '100 000 сум',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: SwipeButton(
                    thumb: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    activeThumbColor: AppColor.Green,
                    activeTrackColor: AppColor.GreenLight,
                    inactiveThumbColor: AppColor.White,
                    inactiveTrackColor: AppColor.Gray2,
                    onSwipe: () {
                      finishedOrderDialog(context);                              // Perform any action you want after swipe
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Yakunlash',
                          style: TextStyle(
                            color: Color(0xFF8CA6C1),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(AppImages.arrows)
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                    minWidth: 50,
                    elevation: 0,
                    height: 50,
                    focusElevation: 0,
                    shape: CircleBorder(),
                    highlightElevation: 0,
                    color: AppColor.GreenLight,
                    onPressed: () {},
                    child: Icon(
                      Icons.phone,
                      color: AppColor.Green,
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );



  }
}
