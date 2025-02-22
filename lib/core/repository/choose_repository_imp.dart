import 'package:doc_app/core/api/auth_api.dart';
import 'package:doc_app/core/models/requests/auth/staff_request.dart';
import 'package:doc_app/core/models/responses/choose/staff_type.dart';
import 'package:doc_app/core/repository/choose_repository.dart';
import 'package:doc_app/utils/response.dart';

import '../../di/get_it.dart';
import '../api/choose_api.dart';

class ChooseRepositoryImpl extends ChooseRepository {

  @override
  Future<Result> fetchChooseAge() =>
      serviceLocator.get<ChooseApi>().fetchChooseAge();

  @override
  Future<Result> choosePosition() =>
      serviceLocator.get<ChooseApi>().choosePosition();

  @override
  Future<Result> fetchChooseSpecialization(StaffType staffType) =>
      serviceLocator.get<ChooseApi>().fetchChooseServices(staffType);

  @override
  Future<Result> registerStaff({required StaffRequest staffRequest}) =>
      serviceLocator.get<AuthApi>().registerStaff(staffRequest: staffRequest);


}
