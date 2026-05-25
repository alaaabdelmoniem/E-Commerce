import 'package:dio/dio.dart';

class Failures {
  final String errorMessage;

  Failures({required this.errorMessage});
}

class ServerFailures extends Failures {
  ServerFailures({required super.errorMessage});

  factory ServerFailures.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures(
          errorMessage:
              'Connection timed out. Please check your internet and try again.',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailures(
          errorMessage: 'Request took too long to send. Please try again.',
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailures(
          errorMessage:
              'Server is taking too long to respond. Please try again later.',
        );

      case DioExceptionType.badCertificate:
        return ServerFailures(
          errorMessage:
              'Secure connection failed. The server certificate is invalid.',
        );

      case DioExceptionType.badResponse:
        return ServerFailures.fromResponse(dioException.response?.statusCode);

      case DioExceptionType.cancel:
        return ServerFailures(
          errorMessage: 'Request was cancelled. Please try again.',
        );

      case DioExceptionType.connectionError:
        return ServerFailures(
          errorMessage:
              'No internet connection. Please check your network and try again.',
        );

      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailures(
            errorMessage: 'No internet connection. Please check your network.',
          );
        }
        return ServerFailures(
          errorMessage: 'An unexpected error occurred. Please try again.',
        );
    }
  }

  factory ServerFailures.fromResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return ServerFailures(
          errorMessage:
              'user already exit. Please check your input and try again.',
        );

      case 401:
        return ServerFailures(
          errorMessage: 'check your email and password and try again.',
        );

      case 403:
        return ServerFailures(
          errorMessage:
              'Access denied. You don\'t have permission to perform this action.',
        );

      case 404:
        return ServerFailures(
          errorMessage: 'The requested resource was not found.',
        );

      case 408:
        return ServerFailures(
          errorMessage: 'Request timed out. Please try again.',
        );

      case 409:
        return ServerFailures(
          errorMessage: 'A conflict occurred. The data may already exist.',
        );

      case 422:
        return ServerFailures(
          errorMessage: 'Invalid data submitted. Please check your input.',
        );

      case 429:
        return ServerFailures(
          errorMessage:
              'Too many requests. Please wait a moment and try again.',
        );

      case 500:
        return ServerFailures(
          errorMessage: 'Internal server error. Please try again later.',
        );

      case 502:
        return ServerFailures(
          errorMessage:
              'Server is temporarily unavailable. Please try again later.',
        );

      case 503:
        return ServerFailures(
          errorMessage:
              'Service is currently unavailable. Please try again later.',
        );

      case 504:
        return ServerFailures(
          errorMessage: 'Server gateway timed out. Please try again later.',
        );

      default:
        return ServerFailures(
          errorMessage:
              'An unexpected error occurred (Code: $statusCode). Please try again.',
        );
    }
  }
}
