import 'package:doc_app/constants/app_color.dart';
import 'package:doc_app/core/models/responses/auth/sucess_login_response.dart';
import 'package:doc_app/navigator/navigator.dart';
import 'package:doc_app/presentation/ui/balance/transactions_screen.dart';
import 'package:doc_app/presentation/ui/kichikhodim/orders/orders_history_screen.dart';
import 'package:doc_app/presentation/ui/main/orders_screen.dart';
import 'package:doc_app/utils/reg_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../constants/app_images.dart';
import '../../../constants/app_style.dart';
import '../../../utils/my_pref.dart';
import '../../helpers/drawer_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    var scaffoldKey = GlobalKey<ScaffoldState>();
  var enabled = false;


  PageController _controller = PageController(initialPage: 0,);
  void _goToPage(int index) {
    _controller.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {

    });
    print("asdasd");
  }
    void lala() async {
      await Prefs.init();
      print(Prefs.getAccessToken());
    }

    @override
  void initState() {
    // TODO: implement initState
      super.initState();
      lala();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
              child: PageView(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Device.get().isAndroid ? 35 : 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                              height: 60,
                              width: 60,
                              child: CircleAvatar(
                                backgroundColor: AppColor.Gray2,
                                backgroundImage: NetworkImage(
                                    "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1200"),
                              )),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Azamov Kh",
                                style: AppStyle.sfproDisplay16Black
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Kichik tibbiy hodim",
                                style: AppStyle.sfproDisplay14w400Black
                                    .copyWith(color: AppColor.Gray5),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 13),
                        decoration: ShapeDecoration(
                          color: Color(0xFFF1F4FA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Balans',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF8F96A0),
                                fontSize: 12,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '100 000 uzs',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: MaterialButton(
                                      onPressed: () {},
                                      highlightElevation: 0,
                                      // Bosilganda ham soyani yo'qotish
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              AppImages.withdraw,
                                            ),
                                            Text(
                                              'Yechish',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      disabledElevation: 0,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 0),
                                      elevation: 0,
                                      focusElevation: 0,
                                      color: AppColor.White,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: MaterialButton(
                                      onPressed: () {},
                                      highlightElevation: 0,
                                      // Bosilganda ham soyani yo'qotish
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: AppColor.BlueMain,
                                            ),
                                            Text(
                                              'To`ldirish',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      disabledElevation: 0,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 0),
                                      elevation: 0,
                                      focusElevation: 0,
                                      color: AppColor.White,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.5, color: AppColor.BlueLight),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                'Men ishdaman',
                                style: TextStyle(
                                  color: Color(0xFF5E646B),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              FlutterSwitch(
                                value: enabled,
                                onToggle: (value) {
                                  enabled = value;
                                  setState(() {});
                                },
                                height: 30,
                                width: 60,
                                activeColor: AppColor.BlueMain,
                              ),
                              SizedBox(width: 8)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          children: [
                            buildMenuItem(
                                AppImages.history, true, 'Buyurtmalar tarixi',(){
                                  openScreen(context, OrdersHistoryScreen());
                            }),
                            buildMenuItem(AppImages.calendar, true, 'Kalendar',(){}),
                            buildMenuItem(
                                AppImages.transaction, true, 'Tranzaksiyalar tarixi',(){
                                  openScreen(context, TransactionsScreen());
                            }),
                            buildMenuItem(
                                AppImages.myinfo, true, 'Mening ma’lumotlarim',(){}),
                            buildMenuItem(
                                AppImages.mycomments, true, 'Menga yozilgan izohlar',(){}),
                            buildMenuItem(
                                AppImages.mycars, true, 'Mening to’lov kartalarim',(){
                            }),
                            buildMenuItem(AppImages.more, true, 'Boshqalar',(){
                              print("object123");
                              _goToPage(1);
                            }),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextButton(
                          onPressed: () {
                            // Add logout functionality
                          },
                          child: Text(
                            'Tizimdan chiqish',
                            style: TextStyle(color: AppColor.Gray5, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Device.get().isAndroid ? 35 : 50,
                      ),

                      Row(
                        children: [
                          IconButton(onPressed: (){
                            _goToPage(0);
                            setState(() {

                            });
                          }, icon:Icon(CupertinoIcons.back) )
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          children: [
                            buildMenuItem(
                                AppImages.contactus, true, 'Biz bilan bog’lanish',(){}),
                            buildMenuItem(AppImages.sharethem, true, 'Ulashish',(){}),
                            buildMenuItem(
                                AppImages.sharethem, true, 'Ilovani baholash',(){}),
                            buildMenuItem(
                              AppImages.language,true,
                              'Ilova tili',(){},
                              trailing: Text(
                                'O\'zbekcha',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            buildMenuItem(
                                AppImages.privacy, true, 'Maxfiylik siyosati',(){}),


                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextButton(
                          onPressed: () {
                            // Add logout functionality
                          },
                          child: Text(
                            'Tizimdan chiqish',
                            style: TextStyle(color: AppColor.Gray5, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
          ),
          key: scaffoldKey,
          backgroundColor: AppColor.Gray2,
          appBar: AppBar(
            elevation: 0.3,
            automaticallyImplyLeading: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: Container(
                    child: SvgPicture.asset(AppImages.menu),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF3F5F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '100 000 uzs',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColor.BlueMain),
                        child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: SvgPicture.asset(AppImages.notification),
                  ),
                )
              ],
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Container(
                height: Device.get().isAndroid ? 42 : 42,
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor.Gray2,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                      color: AppColor.White,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tabs: [
                      Tab(
                        text: "Harita ko’rinishida",
                      ),
                      Tab(
                        text: "Ro’yxat ko’rinishida",
                      )
                    ],
                  ),
                ),
              ),
            ),
            backgroundColor: AppColor.White,
          ),
          body: TabBarView(
            children: [
              OrdersScreen(),
              Container(),
            ],
          )),
    );
  }
}
