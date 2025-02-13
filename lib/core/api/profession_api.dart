import '../../utils/response.dart';

abstract class ProfessionApi{

  Future<Result> fetchDegrees();
}