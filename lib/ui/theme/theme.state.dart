import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/constant/theme.ext.dart';

part 'theme.state.freezed.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(Mode.dark) Mode themeMode
  }) = _ThemeState;
}
