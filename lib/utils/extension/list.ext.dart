extension ListExtension<T> on List<T> {
  List<T> plus(T element) {
    return [...this, element];
  }

  List<T> plusAll(Iterable<T> iterable) {
    return [...this, ...iterable];
  }

  List<T> addBetween(T element, {bool bound = false}) {
    if (length <= 1) {
      return this;
    }
    return [
      if (bound) element,
      ...expand((e) {
        if (e != last) {
          return [e, element];
        } else {
          return [e];
        }
      }),
      if (bound) element,
    ];
  }
}
