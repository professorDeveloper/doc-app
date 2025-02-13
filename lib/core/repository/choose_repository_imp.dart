import 'package:doc_app/core/repository/choose_repository.dart';
import 'package:doc_app/utils/response.dart';

import '../../di/get_it.dart';
import '../api/choose_api.dart';

class ChooseRepositoryImpl extends ChooseRepository{
  @override
  Future<Result> fetchChooseAge() => serviceLocator.get<ChooseApi>().fetchChooseAge();

}