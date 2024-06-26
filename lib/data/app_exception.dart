class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}
class BadRequestExceptionToken extends AppException {
  BadRequestExceptionToken() : super( 'Another device is logged into this account.'," Please logout then login. ");
}
class LargeRequestException extends AppException {
  LargeRequestException([String? message]) : super(message, 'Large File Request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, '');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

class InternalServerException extends AppException {
  InternalServerException([String? message])
      : super(message, 'Internal Server Error');
}
