import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/constant/status.k.dart';

part 'login.state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(Status.idle) Status status,
    @Default('') String email,
    @Default('') String password,
    @Default('') String message,
  }) = _LoginState;
}
