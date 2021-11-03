class RequestException implements Exception {
  final String? message;

  RequestException([
    this.message,
  ]);
}
