import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/constant/theme.ext.dart';
import 'package:skeleton/services/shared_preference.dart';
import 'package:skeleton/ui/theme/theme.state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());
  void toggle() {
    if (state.themeMode == Mode.light) {
      Application().sharedPreferences.setBool('darkMode', true);
      emit(state.copyWith(themeMode: Mode.dark));
    } else {
      Application().sharedPreferences.setBool('darkMode', false);
      emit(state.copyWith(themeMode: Mode.light));
    }
  }
}
