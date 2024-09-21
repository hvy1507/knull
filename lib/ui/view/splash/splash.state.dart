import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash.state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(false) bool hasLoggedIn,
  }) = _SplashState;
}