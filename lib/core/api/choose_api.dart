import 'package:doc_app/core/models/responses/choose/staff_type.dart';
import 'package:doc_app/utils/response.dart';

import '../models/responses/choose/choose_response.dart';

abstract class ChooseApi{
  Future<Result> choosePosition();
  Future<Result>  fetchChooseAge();
  Future<Result> fetchChooseServices(StaffType staffType);
}