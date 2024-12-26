import 'package:dio/dio.dart';

abstract class ApiExceptions implements Exception {
  final String message;
  final Response? response;

  ApiExceptions(
    this.message, {
    this.response,
  });
}

class ApiConnectionException extends ApiExceptions {
  ApiConnectionException(super.message);
}

class ApiJwtTokenException extends ApiExceptions {
  ApiJwtTokenException(super.message);
}

class ApiErrorException extends ApiExceptions {
  ApiErrorException(super.message);
}

class ApiInternalErrorException extends ApiExceptions {
  ApiInternalErrorException(super.message);
}

class ApiBadRequestException extends ApiExceptions {
  ApiBadRequestException(super.message);
}

class ApiUnauthorizedException extends ApiExceptions {
  ApiUnauthorizedException(super.message);
}

class ApiForbiddenRequestException extends ApiExceptions {
  ApiForbiddenRequestException(super.message);
}

class ApiTimeoutException extends ApiExceptions {
  ApiTimeoutException(super.message);
}

class ApiSessionExpiredException extends ApiExceptions {
  ApiSessionExpiredException(super.message);
}

class ApiNotFoundException extends ApiExceptions {
  ApiNotFoundException(super.message);
}

class AppCatchException extends ApiExceptions {
  AppCatchException(super.message);
}

class ApiLoopDetectedException extends ApiExceptions {
  ApiLoopDetectedException(super.message);
}

class ApiRequestRangeNotSatisfiableException extends ApiExceptions {
  ApiRequestRangeNotSatisfiableException(super.message);
}

class ApiPreconditionRequiredException extends ApiExceptions {
  ApiPreconditionRequiredException(super.message);
}

class FlowPeopleCheckException extends ApiExceptions {
  FlowPeopleCheckException(super.message, {required super.response});
}

class ApiPaymentRequiredException extends ApiExceptions {
  ApiPaymentRequiredException(super.message, {required super.response});
}
