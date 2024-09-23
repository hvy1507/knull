import 'package:shared_preferences/shared_preferences.dart';

class Application {
  factory Application() => instance;

  Application._() {
    _init();
  }

  static final instance = Application._();

  Future<void> _init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  late final SharedPreferences sharedPreferences;
}