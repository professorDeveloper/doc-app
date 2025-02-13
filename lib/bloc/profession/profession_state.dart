part of 'profession_bloc.dart';

@immutable
sealed class ProfessionState {}

final class ProfessionInitial extends ProfessionState {}
final class ProfessionLoading extends ProfessionState {}
final class ProfessionLoaded extends ProfessionState {
  final List<EducationLevel> ageList;
  ProfessionLoaded({
    required this.ageList,});
}

final class ProfessionError extends ProfessionState {
  final String message;
  ProfessionError({required this.message});
}
