part of 'verify_bloc.dart';

@immutable
abstract class VerifyState {}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifySuccess extends VerifyState {
 final VerifyCodeResponse sendSmsCodeResponse;

 VerifySuccess({required this.sendSmsCodeResponse});
}
class VerifyRegistredSuccess extends VerifyState {
 final UserResponse userResponse;

 VerifyRegistredSuccess({required this.userResponse});
}

class VerifyFailure extends VerifyState {
  final String error;

  VerifyFailure({required this.error});}
