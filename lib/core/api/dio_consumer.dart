import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabeet/core/api/api_consumer.dart';
import 'package:mabeet/core/api/api_interceptors.dart';
import 'package:mabeet/core/errors/exceptions.dart';
import 'package:mabeet/core/api/api_constants.dart';

class DioConsumer extends ApiConsumer {
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiConstants.BaseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        error: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }

  final Dio dio;

  @override
  Future delete(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = true,
  }) async {
    try {
      dynamic finalData = data;
      if (isFormData && data != null && data is Map<String, dynamic>) {
        finalData = await _buildFormData(data);
      }
      final response = await dio.post(
        path,
        data: finalData,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  Future<FormData> _buildFormData(Map<String, dynamic> data) async {
    Map<String, dynamic> formDataMap = {};

    for (var entry in data.entries) {
      if (entry.value is XFile) {
        XFile file = entry.value as XFile;
        String extension = file.path.split('.').last;
        DioMediaType contentType = extension.isNotEmpty
            ? DioMediaType('image', extension)
            : DioMediaType('application', 'application/json');

        formDataMap[entry.key] = await MultipartFile.fromFile(
          file.path,
          filename: file.name,
          contentType: contentType,
        );
      } else {
        formDataMap[entry.key] = entry.value;
      }
    }

    return FormData.fromMap(formDataMap);
  }
}
