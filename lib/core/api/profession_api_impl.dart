import 'package:dio/dio.dart';
import 'package:doc_app/core/api/profession_api.dart';
import 'package:doc_app/core/models/responses/profession/education_level_model.dart';
import 'package:doc_app/utils/response.dart';

import '../../constants/keys.dart';
import '../../di/get_it.dart';

class ProfessionApiImpl extends ProfessionApi {
  @override
  Future<Result> fetchDegrees() async {
    try {
      final response = await serviceLocator.get<Dio>().get(
        options: Options(

          headers: {
            "Authorization": "Bearer ${Keys.token}", // Tokenni shu yerga qo'ying
          },
        ),
            "${Keys.baseUrl}/api/v1/degrees/",
          );
      print("Request: ${response.requestOptions.uri.toString()}");

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        final ageList = parseEducationLevels(data);
        return Success<List<EducationLevel>>(ageList);
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
