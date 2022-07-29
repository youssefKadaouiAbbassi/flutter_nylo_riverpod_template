import 'package:nylo_framework/nylo_framework.dart';

class BearerAuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? userToken =  await NyStorage.read<String>('accessToken');
    if (userToken != null) {
      options.headers.addAll({"Authorization": "Bearer $userToken"});
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
