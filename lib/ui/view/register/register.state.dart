import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/constant/status.k.dart';

part 'register.state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(Status.idle) Status status,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmedPassword,
    @Default(false) bool isValid,
    @Default('') String message,
  }) = _RegisterState;

  const RegisterState._();

  bool get matchPassword =>
      password == confirmedPassword && confirmedPassword.isNotEmpty;

  bool get validEmail {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
  bool get canRegister => matchPassword && validEmail;
}
