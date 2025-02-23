import 'package:doc_app/bloc/choose/choose_bloc.dart';
import 'package:doc_app/bloc/register/register_bloc.dart';
import 'package:doc_app/core/models/responses/choose/staff_type.dart';
import 'package:doc_app/presentation/ui/chooses/choose_position_screen.dart';
import 'package:doc_app/presentation/ui/auth/login_screen.dart';
import 'package:doc_app/presentation/ui/kichikhodim/auth/PagerScreen.dart';
import 'package:doc_app/presentation/ui/main/main_screen.dart';
import 'package:doc_app/utils/my_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login/login_bloc.dart';
import 'bloc/login/send_sms_code_bloc.dart';
import 'bloc/profession/profession_bloc.dart';
import 'bloc/verify/verify_bloc.dart';
import 'constants/app_color.dart';
import 'di/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            String? token = snapshot.data as String?;

            return MultiBlocProvider(
              providers: [
                BlocProvider<LoginBloc>(
                  create: (context) => LoginBloc(),
                ),
                BlocProvider<RegisterBloc>(
                  create: (context) => RegisterBloc(),
                ),
                BlocProvider<SendSmsCodeBloc>(
                  create: (context) => SendSmsCodeBloc(),
                ),
                BlocProvider<VerifyBloc>(
                  create: (context) => VerifyBloc(),
                ),
                BlocProvider<ChooseBloc>(
                  create: (context) => ChooseBloc(),
                ),
                BlocProvider<ProfessionBloc>(
                  create: (context) => ProfessionBloc(),
                ),

                // BlocProvider<RegisterBloc>(
                //   create: (context) => RegisterBloc(),
                // ),
              ],
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return MaterialApp(
                      title: 'Flutter Demo',
                      theme: ThemeData(
                        fontFamily: 'SfProDisplay',
                        // This is the theme of your application.
                        //
                        // TRY THIS: Try running your application with "flutter run". You'll see
                        // the application has a purple toolbar. Then, without quitting the app,
                        // try changing the seedColor in the colorScheme below to Colors.green
                        // and then invoke "hot reload" (save your changes or press the "hot
                        // reload" button in a Flutter-supported IDE, or press "r" if you used
                        // the command line to start the app).
                        //
                        // Notice that the counter didn't reset back to zero; the application
                        // state is not lost during the reload. To reset the state, use hot
                        // restart instead.
                        //
                        // This woqrks for code too, not just values: Most code changes can be
                        // tested with just a hot reload.
                        colorScheme:
                            ColorScheme.fromSeed(seedColor: AppColor.BlueMain),
                        useMaterial3: false,
                      ),
                      home: token != null && token.isNotEmpty
                          ? LoginScreen()
                          : LoginScreen());
                },
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Future<String?> init() async {
    await Prefs.init();

    return Prefs.getAccessToken();
  }
}
