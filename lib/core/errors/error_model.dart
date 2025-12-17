import 'package:mabeet/core/api/api_constants.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  const ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('message') && json['message'] is String) {
        String serverMessage = json['message'];
        if (json.containsKey('errors') && json['errors'] is Map<String, dynamic>) {
          Map<String, dynamic> errors = json['errors'];
          String? firstDetailedError = errors.values
              .expand((e) => e as Iterable)
              .firstWhere((element) => element is String, orElse: () => null);
          if (firstDetailedError != null) {
            serverMessage = firstDetailedError;
          }
        }

        return ErrorModel(
          status: 422,
          errorMessage: serverMessage,
        );
      }
      if (json.containsKey(ApiKey.errorMessage)) {
        return ErrorModel(
          status: json[ApiKey.status] as int? ?? 0,
          errorMessage: json[ApiKey.errorMessage] as String? ?? 'An error occurred.',
        );
      }
      return const ErrorModel(
        status: 0,
        errorMessage: 'The server returned an unrecognizable error structure.',
      );
    }
    final String message = json is String && json.isNotEmpty
        ? json
        : 'The server returned an unhandled error format.';

    return ErrorModel(
      status: 0,
      errorMessage: message,
    );
  }
}