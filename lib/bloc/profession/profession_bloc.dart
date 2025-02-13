import 'package:bloc/bloc.dart';
import 'package:doc_app/core/repository/profession_repository.dart';
import 'package:meta/meta.dart';

import '../../core/models/responses/profession/education_level_model.dart';
import '../../di/get_it.dart';
import '../../utils/response.dart';

part 'profession_event.dart';

part 'profession_state.dart';

class ProfessionBloc extends Bloc<ProfessionEvent, ProfessionState> {
  final ProfessionRepository chooseRepository =
      serviceLocator<ProfessionRepository>();

  ProfessionBloc() : super(ProfessionInitial()) {
    on<GetProfessions>((event, emit)async {
      emit(ProfessionLoading());
      var fetched=await chooseRepository.fetchDegrees();
      if(fetched is Success<List<EducationLevel>>){
        emit(ProfessionLoaded(ageList: fetched.data));
        }
      else if(fetched is Error){
        emit(ProfessionError(message: fetched.errorMessage));

      }
    });
  }
}
