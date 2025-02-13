part of 'choose_bloc.dart';

@immutable
sealed class ChooseState {}

final class ChooseInitial extends ChooseState {}

final class ChooseLoading extends ChooseState {}

final class ChooseSuccessState extends ChooseState {
  final List<AgeResponse> ageList;

  ChooseSuccessState({required this.ageList});
}

final class ChooseErrorState extends ChooseState {
  final String message;

  ChooseErrorState({required this.message});
}