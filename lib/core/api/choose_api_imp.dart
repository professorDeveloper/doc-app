import 'package:dio/dio.dart';
import 'package:doc_app/di/get_it.dart';
import 'package:doc_app/utils/response.dart';

import '../../constants/keys.dart';
import '../models/responses/choose/choose_response.dart';
import 'choose_api.dart';

class ChooseApiImpl extends ChooseApi {
  @override
  Future<Result> fetchChooseAge() async {
    try {
      final response =  await serviceLocator.get<Dio>().get("${Keys.baseUrl}/api/v1/enum/accepted_age/");
      print("Request: ${response.requestOptions.uri.toString()}");

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        final ageList = AgeResponse.fromJsonList(data);
        return Success<List<AgeResponse>>(ageList);
      } else {
        print(response.data.toString());
        return Error(response.data["detail"].toString());
      }
    } catch (e) {
      print(e.toString());
      return Error("Xatolik yuz berdi: $e");
    }
  }
}
