import 'dart:developer';

import '../core/models/fake/auth_reg_data.dart';
import '../core/models/responses/choose/choose_response.dart';

class RegData {
  static final RegData _instance = RegData._internal();

  factory RegData() {
    return _instance;
  }

  RegData._internal();

  AgeResponse? ageResponse;
  AuthLocalData? asa;
  String? selfDescription;
  void setLocalAuthResponse(AuthLocalData authLocalData) {
    asa = authLocalData;
  }
  void setAgeResponse(AgeResponse response) {
    ageResponse = response;
  }
  void setSelfDescription(String desc) {
    selfDescription = desc;
  }

  AuthLocalData? getLocalAuthResponse() {
    return asa;
  }
  AgeResponse? getAgeResponse() {
    return ageResponse;
  }
  String? getSelfDescription() {
    return selfDescription;
  }
}
