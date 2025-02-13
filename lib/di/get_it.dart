import 'package:dio/dio.dart';
import 'package:doc_app/bloc/profession/profession_bloc.dart';
import 'package:doc_app/constants/keys.dart';
import 'package:doc_app/core/api/choose_api.dart';
import 'package:doc_app/core/api/choose_api_imp.dart';
import 'package:doc_app/core/api/profession_api.dart';
import 'package:doc_app/core/api/profession_api_impl.dart';
import 'package:doc_app/core/repository/choose_repository.dart';
import 'package:doc_app/core/repository/choose_repository_imp.dart';
import 'package:doc_app/core/repository/profession_repository.dart';
import 'package:doc_app/core/repository/profession_repository_imp.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/login/login_bloc.dart';
import '../core/api/auth_api_impl.dart';

final GetIt serviceLocator = GetIt.instance;


Future<void> setupLocator() async {
  //Repositories
  serviceLocator.registerLazySingleton<ChooseApi>(() => ChooseApiImpl());
  serviceLocator.registerLazySingleton<ChooseRepository>(() =>
      ChooseRepositoryImpl());
  serviceLocator.registerLazySingleton<ProfessionRepository>(() =>
      ProfessionRepositoryImp());
  serviceLocator.registerLazySingleton(() => AuthApiImpl());
  serviceLocator.registerLazySingleton<ProfessionApi>(() =>
      ProfessionApiImpl());
  serviceLocator.registerLazySingleton(() => LoginBloc());
  serviceLocator.registerLazySingleton(() => ProfessionBloc());
  serviceLocator.registerLazySingleton<Dio>(() =>
      Dio(BaseOptions(
        followRedirects: true,
        maxRedirects: 15,
        baseUrl: Keys.baseUrl,
        connectTimeout: Duration(seconds: 15),
        // Optional: Adjust timeouts if needed
        receiveTimeout: Duration(
            seconds: 15), // Optional: Adjust timeouts if needed

      )));
}
