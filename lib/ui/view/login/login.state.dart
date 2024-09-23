import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/constant/status.k.dart';

part 'login.state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(Status.loading) Status status,
    @Default('') String phoneNumber,
    @Default('') String password,

  }) = _LoginState;
}
