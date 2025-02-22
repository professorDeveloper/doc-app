import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:doc_app/core/models/requests/auth/staff_request.dart';
import 'package:doc_app/utils/reg_data.dart';
import 'package:http/http.dart' as http;

import '../../constants/keys.dart';
import '../../di/get_it.dart';
import '../../utils/my_pref.dart';
import '../../utils/response.dart';
import '../../utils/utils.dart';
import '../models/requests/auth/login_request.dart';
import '../models/requests/auth/register_request.dart';
import '../models/requests/auth/send_sms_code_request.dart';
import '../models/requests/verify/verify_request.dart';
import '../models/responses/auth/error_response.dart';
import '../models/responses/auth/login_response.dart';
import '../models/responses/auth/register_response.dart';
import '../models/responses/auth/send_sms_code_response.dart';
import '../models/responses/auth/verify_success.dart';
import 'auth_api.dart';

class AuthApiImpl implements AuthApi {
  @override
  Future<Result> sendSms(
      {required SendSmsCodeRequest sendSmsCodeRequest}) async {
    try {
      final response = await serviceLocator.get<Dio>().post(
          "${Keys.baseUrl}/api/v1/auth/verify-phone/",
          data: sendSmsCodeRequest.toJson());
      // print("Request: ${response.requestOptions.data.toString()}");
      // print("Request: ${response.requestOptions.uri.toString()}");

      if (response.statusCode == 200) {
        final sendsms = SendSmsCodeResponse.fromJson(response.data);
        return Success<SendSmsCodeResponse>(sendsms);
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
  Future<Result> verify({required VerifyRequest request}) async {
    try {
      print(request.toJson());
      String bodyData =
          jsonEncode({"code": "${request.code}", "phone": "+${request.phone}"});
      final response = await http.post(
          Uri.parse("${Keys.baseUrl}api/v1/auth/verify-code/"),
          headers: {"Content-Type": "application/json"},
          body: bodyData);

      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response.body);
        print(jsonMap.toString());
        var verifyResponse = VerifyCodeResponse.fromJson(jsonMap);
        return Success<VerifyCodeResponse>(verifyResponse);
      } else {
        var errorResponse = ErrorResponse.fromJson(json.decode(response.body));
        print("Fail ::::" + response.body);
        return Error(errorResponse.detail.toString());
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }

    throw UnimplementedError();
  }

  @override
  Future<Result> login({required LoginRequest loginRequest}) async {
    try {
      final response1 = await http.post(
          Uri.parse("${Keys.baseUrl}/accounts/token/"),
          body: loginRequest.toJson());
      print(response1.body);

      if (response1.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response1.body);
        var loginResponse = LoginResponse.fromJson(jsonMap);
        init();
        Prefs.setUserPassword(loginRequest.password!);
        Prefs.setUserPhone(loginRequest.phone!);

        // Return a Success result with the login response data
        return Success(loginResponse);
      } else {
        // If the response is not successful, handle the error
        var errorData = json.decode(response1.body);

        return Error(ErrorResponse.fromJson(errorData).detail!);
      }
    } catch (e) {
      // Handle other types of exceptions, e.g., network errors
      throw Exception(e);
    }
  }

  @override
  Future<Result> register({required RegisterRequest registerRequest}) async {
    try {
      final response = await http.post(
          Uri.parse("${Keys.baseUrl}/accounts/register/"),
          body: registerRequest.toJson());
      print(response.body.toString() + "response ;;;");
      if (response.statusCode == 200) {
        if (response.body.contains("access_token")) {
          print("aaaassasda");
          print(response.body);
          Map<String, dynamic> jsonMap = json.decode(response.body);
          var registerResponse = RegisterResponse.fromJson(jsonMap);
          init();
          Prefs.setUserPassword(registerRequest.password!!);
          Prefs.setUserPhone(registerRequest.phone!);
          print(registerResponse.accessToken);
          return Success(registerResponse);
        } else {
          Map<String, dynamic> jsonMap = json.decode(response.body);
          print("asdasdad"
                  "" +
              jsonMap.toString());

          return Error(ErrorResponse.fromJson(jsonMap) as String);
        }
      } else {
        var errorData = json.decode(response.body);
        print("ErrorData" + errorData);
        return Error(errorData);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future init() async {
    await Prefs.init();
  }

  @override
  Future<Result> registerStaff({required StaffRequest staffRequest}) async {
    try {
      // Convert StaffRequest object to JSON
      final requestData = staffRequest.toJson();
      print("Request Data: $requestData");
      // Send POST request to register staff
      final response = await serviceLocator.get<Dio>().post(
        "${Keys.baseUrl}/api/v1/staff/",
        data: requestData,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $registerToken',

          // Add your CSRF token or other headers if required
        }),
      );

      // Handle successful response
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("Response Data: ${response.data}");
        return Success(response.data); // Return Success with response data
      } else {
        print("Error Response: ${response.data}");
        return Error(response.data["detail"].toString());
      }
    } catch (e) {
      print("Error Occurred: $e");
      return Error("Xatolik yuz berdi: $e");
    }
  }
}
