part of 'choose_bloc.dart';

@immutable
sealed class ChooseEvent {}

final class FetchChooseEvent extends ChooseEvent {}
final class FetchChoosePositionEvent extends ChooseEvent {}
final class FetchChooseSpecializationEvent extends ChooseEvent {
  final StaffType staffType;
  FetchChooseSpecializationEvent({required this.staffType});
}