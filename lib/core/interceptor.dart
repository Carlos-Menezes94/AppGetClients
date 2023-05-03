import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../app/presentation/controllers/client_controller.dart';

class TokenInterceptor extends Interceptor {
  ClientControler controller = GetIt.I.get<ClientControler>();



  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (controller.store.token!.isNotEmpty) {
      options.headers['Authorization'] = controller.store.token;
    }
    return handler.next(options);
  }
}
