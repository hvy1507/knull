import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/constant/status.k.dart';

part 'register.state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(Status.idle) Status status,
    @Default('') String email,
    @Default('') String password,

  }) = _RegisterState;
}
