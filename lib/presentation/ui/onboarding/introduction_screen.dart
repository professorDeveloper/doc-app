import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/my_pref.dart';
import '../../../animations/custom_animation.dart';
import '../../../constants/app_color.dart';
import '../../../constants/app_style.dart';
import '../../../navigator/navigator.dart';
import '../../../resources/onboarding/model_contents.dart';
import '../auth/login_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    print("lala123");
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Prefs.init();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffacd0f8),
              Color(0x71d0e0f6),
              Color(0xffffffff),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, i) {
                  // Responsive layout for page items

                  return Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Column(
                        children: [
                          const Spacer(),
                          Image.asset(
                            height: Device.get().isAndroid ? 370 : 380,
                            width: double.infinity,
                            contents[i].image,
                          ),

                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: AppStyle.sfProDisplay24w600,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Expanded(
                              child: Text(
                                maxLines: 3,
                                contents[i].description,
                                style: AppStyle.sfproDisplay18Gray5,
                              ),
                            ),
                          ),
                          const Spacer(),

                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomAnimationsSlide(
              direction: FadeSlideDirection.btt,
              duration: 0.8,
              child: Container(
                height: Device.get().isAndroid ? 55 : 57,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: MaterialButton(
                  color: AppColor.BlueMain,
                  onPressed: () async {
                    if (currentIndex == contents.length - 1) {
                      await Prefs.setBool("isFirst", true);
                      openScreen(context, const LoginScreen());

                    }
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  focusElevation: 0,
                  textColor: AppColor.White,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: currentIndex == contents.length - 1
                      ? Text("Boshlash")
                      : Row(
                          children: [
                            Spacer(),
                            Text("Keyingisi"),
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
            SizedBox(height: 24),
            CustomAnimationsSlide(
              direction: FadeSlideDirection.btt,
              duration: 0.8,
              child: TextButton(
                onPressed: () {
                  openScreen(context, const LoginScreen());
                },
                child: Text(
                  "O’tkazib yuborish",
                  style: AppStyle.sfproDisplay16Nonormal,
                ),
              ),
            ),
            SizedBox(
              height: Device.get().isAndroid ? 20 : 50,
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 15 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: currentIndex == index
          ? BoxDecoration(shape: BoxShape.circle, color: AppColor.BlueMain)
          : BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.Gray3,
            ),
    );
  }
}
