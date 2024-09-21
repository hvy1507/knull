extension FutureExtension<T> on Future<T> {
  Future<T> retry({
    Duration? delay,
    int? retryFor,
    bool Function(Object)? catchExceptionOfTypes,
  }) async {
    var retryCount = -1;
    while (true) {
      retryCount++;
      try {
        return this;
      } catch (e) {
        if (catchExceptionOfTypes != null && catchExceptionOfTypes(e)) {
          rethrow;
        } else if (retryFor != null && retryCount >= retryFor) {
          rethrow;
        }
      }
      if (delay != null) {
        await Future.delayed(delay);
      }
    }
  }
}