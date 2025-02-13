import 'package:doc_app/utils/response.dart';

import '../models/responses/choose/choose_response.dart';

abstract class ChooseApi{
  Future<Result>  fetchChooseAge();
}