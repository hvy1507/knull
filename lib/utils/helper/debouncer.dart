import 'dart:async';

import 'package:flutter/foundation.dart';

class Debounce {
  Duration? duration;
  VoidCallback? action;
  Timer? _timer;

  Debounce({this.duration});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(duration ?? const Duration(milliseconds: 500), action);
  }
}
