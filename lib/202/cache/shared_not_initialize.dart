class SharedNotInitializeException implements Exception {
  @override
  String toString() {
    return "Your preferences has not initialize right now";
  }
}