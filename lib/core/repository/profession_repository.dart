import '../../utils/response.dart';

abstract class ProfessionRepository {
  Future<Result> fetchDegrees();
}