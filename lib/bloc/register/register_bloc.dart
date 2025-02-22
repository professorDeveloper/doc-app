import 'package:bloc/bloc.dart';
import 'package:doc_app/core/models/requests/auth/staff_request.dart';
import 'package:meta/meta.dart';

import '../../core/api/auth_api_impl.dart';
import '../../di/get_it.dart';
import '../../utils/response.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthApiImpl authApi = serviceLocator<AuthApiImpl>();

    RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());

      try {
        // Call the API
        final result =
            await authApi.registerStaff(staffRequest: event.staffRequest);

        if (result is Success) {
          print("Success");
          emit(RegisterSuccess(response: result.data));
        } else if (result is Error) {
          emit(RegisterFailure(error: result.errorMessage));
        }
      } catch (e) {
        print("Error in RegisterBloc: $e");
        emit(RegisterFailure(error: "Xatolik yuz berdi: $e"));
      }
    });
  }
}
