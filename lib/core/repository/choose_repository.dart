import 'package:doc_app/core/models/responses/choose/staff_type.dart';
import 'package:doc_app/utils/response.dart';

import '../models/requests/auth/staff_request.dart';

abstract class ChooseRepository {
  Future<Result> fetchChooseAge();
  Future<Result> choosePosition();
  Future<Result> fetchChooseSpecialization(StaffType staffType);
  Future<Result> registerStaff({required StaffRequest staffRequest});
}