import 'package:dio/dio.dart';
import 'package:doc_app/di/get_it.dart';
import 'package:doc_app/utils/response.dart';

import '../../constants/keys.dart';
import '../models/responses/choose/choose_response.dart';
import '../models/responses/choose/choose_specalization_response.dart';
import '../models/responses/choose/staff_type.dart';
import 'choose_api.dart';

class ChooseApiImpl extends ChooseApi {
  @override
  Future<Result> fetchChooseAge() async {
    try {
      final response = await serviceLocator
          .get<Dio>()
          .get("${Keys.baseUrl}/api/v1/enum/accepted_age/");
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

  @override
  Future<Result> choosePosition() async {
    try {
      final response = await serviceLocator
          .get<Dio>()
          .get("${Keys.baseUrl}/api/v1/staff-type/");

      if (response.statusCode == 200) {
        // Parse the JSON data into a List of StaffType objects
        List<StaffType> staffList = staffTypeListFromJson(response.data);

        // Return success with the list of staff types
        return Success<List<StaffType>>(staffList);
      } else {
        // Return failure with error message
        return Error("Failed to load staff types");
      }
    } catch (e) {
      // Return failure with exception message
      return Error(e.toString());
    }
  }

  @override
  Future<Result> fetchChooseServices(StaffType staffType) async {
    try {
      final response = await serviceLocator.get<Dio>().get(
            "${Keys.baseUrl}/api/v1/specializations/?staff_category=${staffType.id}",
          );
      print(response.data.toString());
      if (response.statusCode == 200) {
        List<Specialization> specializations = (response.data as List)
            .map((item) => Specialization.fromJson(item))
            .toList();
        print("sucess");

        return Success<List<Specialization>>(specializations);
      } else {
        // Return Failure with Error Message
        print("Failed");

        return Error("Failed to load services");
      }
    } catch (e) {
      print(e.toString());
      print("catch");

      // Return Failure with Exception Message
      return Error(e.toString());
    }
  }
}
