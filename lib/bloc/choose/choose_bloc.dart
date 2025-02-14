import 'package:bloc/bloc.dart';
import 'package:doc_app/core/api/choose_api.dart';
import 'package:doc_app/core/repository/choose_repository.dart';
import 'package:meta/meta.dart';

import '../../core/api/auth_api_impl.dart';
import '../../core/models/responses/choose/choose_response.dart';
import '../../di/get_it.dart';
import '../../utils/response.dart';

part 'choose_event.dart';

part 'choose_state.dart';

class ChooseBloc extends Bloc<ChooseEvent, ChooseState> {
  final ChooseRepository chooseRepository = serviceLocator<ChooseRepository>();
  List<AgeResponse> ageList=[AgeResponse(id: "1", name: "Ikkisini ham"),AgeResponse(id: "2", name: "Faqat Kattalar") ,AgeResponse(id: "3", name: "Faqat Kichiklar")];

  ChooseBloc() : super(ChooseInitial()) {
    on<FetchChooseEvent>((event, emit) async {
      emit(ChooseLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(ChooseSuccessState(ageList: ageList));

      // var fetched = await chooseRepository.fetchChooseAge();
      // if (fetched is Success<List<AgeResponse>>) {
      //   emit(ChooseSuccessState(ageList: fetched.data));
      // } else if (fetched is Error) {
      //   emit(ChooseSuccessState(ageList: ageList));
      // }
    });
  }
}
