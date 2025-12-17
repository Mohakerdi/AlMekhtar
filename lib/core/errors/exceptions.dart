import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mabeet/core/errors/error_model.dart';


class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});

  @override
  String toString() => 'ServerException: ${errorModel.errorMessage}';
}

ErrorModel _handleNonResponseError(DioException e) {
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.sendTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.connectionError) {
    return const ErrorModel(
      status: 0,
      errorMessage: 'Connection error. Please check your internet connection and try again.',
    );
  }

  return const ErrorModel(
    status: 0,
    errorMessage: 'An unexpected error occurred.',
  );
}

void handleDioExceptions(DioException e) {
  if (e.response == null) {
    if (e.error is SocketException) {
      throw ServerException(
        errorModel: const ErrorModel(
          status: 0,
          errorMessage: 'No Internet Connection. Please connect to the internet and try again.',
        ),
      );
    }

    throw ServerException(
      errorModel: _handleNonResponseError(e),
    );
  }
  else {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        break;

      case DioExceptionType.badResponse:
        final statusCode = e.response!.statusCode;

        if (statusCode != null && (statusCode >= 400 && statusCode < 600)) {
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        }

        throw ServerException(
          errorModel: const ErrorModel(
            status: 0,
            errorMessage: 'Received a bad response from the server.',
          ),
        );
    }
  }
}