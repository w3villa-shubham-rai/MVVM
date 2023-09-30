class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, "No internet");
}

class RequestTimeout extends AppException {
  RequestTimeout([String? message]) : super(message, "Request timeout");
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, "Internal Server error");
}

class InvalidUrl extends AppException {
  InvalidUrl([String? message]) : super(message, "Invalid url");
}

class FetchedDataException extends AppException {
  FetchedDataException([String? message]) : super(message,"Error communictio");
}
