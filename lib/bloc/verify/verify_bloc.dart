import 'package:doc_app/utils/my_pref.dart';
import 'package:doc_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api/auth_api_impl.dart';
import '../../core/models/requests/verify/verify_request.dart';
import '../../core/models/responses/auth/send_sms_code_response.dart';
import '../../core/models/responses/auth/verify_success.dart';
import '../../di/get_it.dart';
import '../../utils/response.dart';

part 'verify_event.dart';

part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final AuthApiImpl authApi = serviceLocator<AuthApiImpl>();

  VerifyBloc() : super(VerifyInitial()) {
    on<VerifyButtonPressed>((event, emit) async {
      emit(VerifyLoading());

      try {
        final response = await authApi.verify(
            request: VerifyRequest(code: event.code, phone: event.phone));
        if (response is Success<VerifyCodeResponse>) {
          var sendSmsCodeResponse = response.data;
          print(sendSmsCodeResponse.message);
          registerToken=sendSmsCodeResponse.token;
          print("Token Successfully saved${registerToken.length}");
          emit(VerifySuccess(sendSmsCodeResponse: sendSmsCodeResponse));
        } else if (response is Error) {
          emit(VerifyFailure(error: response.errorMessage.toString()));
        }
      } catch (e) {
        emit(VerifyFailure(error: e.toString()));
      }
    });
  }
}
