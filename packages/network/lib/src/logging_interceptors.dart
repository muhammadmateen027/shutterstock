import 'package:dio/dio.dart';

/// A sub-class of the Interceptor to do some custom actions
class LoggingInterceptors extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// We can add custom handler in this layer of interceptor during request
    if (options.extra['customProgress'] ?? true) {
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /// in response we will check if custom Handler to perform action
    if (response.extra['customProgress'] ?? true) {
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    /// in error response we will check if custom Handler to perform action
    super.onError(err, handler);
  }
}
