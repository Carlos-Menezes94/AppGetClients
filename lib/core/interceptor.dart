import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../app/presentation/controllers/clients_controller.dart';

class TokenInterceptor extends InterceptorsWrapper {
  ClientsControler controller = GetIt.I.get<ClientsControler>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (controller.store.token!.isNotEmpty) {
      options.headers['Authorization'] = controller.store.token;
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    print("Error: $error");

    return handler.next(error);
  }
}
