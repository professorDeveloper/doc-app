import 'package:doc_app/core/api/profession_api.dart';
import 'package:doc_app/core/repository/profession_repository.dart';
import 'package:doc_app/di/get_it.dart';
import 'package:doc_app/utils/response.dart';

class ProfessionRepositoryImp extends ProfessionRepository {
  @override
  Future<Result> fetchDegrees()=> serviceLocator.get<ProfessionApi>().fetchDegrees();
}