import 'package:dio/dio.dart';
import 'package:mabeet/core/api/api_constants.dart';
import 'package:mabeet/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['lang'] = 'ar' / 'en';
    options.headers['Accept'] = 'application/json';
    options.headers['Content-type'] = 'application/json';

    final String? token = CacheHelper.getData(key: ApiKey.token);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}
