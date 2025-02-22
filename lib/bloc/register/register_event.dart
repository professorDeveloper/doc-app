part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final StaffRequest staffRequest;

  RegisterButtonPressed({required this.staffRequest});
}
