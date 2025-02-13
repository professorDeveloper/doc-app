import '../core/models/responses/choose/choose_response.dart';

class RegData {
  static final RegData _instance = RegData._internal();

  factory RegData() {
    return _instance;
  }

  RegData._internal();

  AgeResponse? ageResponse;

  void setAgeResponse(AgeResponse response) {
    ageResponse = response;
  }

  AgeResponse? getAgeResponse() {
    return ageResponse;
  }
}
