import 'package:app_menezes/core/response.dart';
import 'package:dio/dio.dart';
import '../../../../core/interceptor.dart';
import '../../api/client/client_operation_endpoints.dart';
import '../../models/clients/create_response_model.dart';
import 'clients_gym_datasource_abstract.dart';

class ClientsGymDataSourceImpl implements ClientsGymDataSourceAbstract {
  @override
  Future<DatasourceResponse> createNewClient({required CreateNewClientModel data}) async {
    final dio = Dio();
    dio.interceptors.add(TokenInterceptor());

    final dataCreateInfo = data.toJson();
    final response = await dio.post(
        ClientOperationEndpoints().getClientsOurCreateNew,
        data: dataCreateInfo);

    if (response.statusCode == 200) {
      return DatasourceResponse(data: response.data["data"], success: true);
    } else {
      return DatasourceResponse(data: response.data["data"], success: false);
    }
  }

  @override
  Future<DatasourceResponse> deleteClient({required int id}) async {
    throw UnimplementedError();
  }

  @override
  Future<DatasourceResponse> getClientWithId({int? id}) async {
    final dio = Dio();
    dio.interceptors.add(TokenInterceptor());

    final response = await dio.get(
      ClientOperationEndpoints().getClientsOurCreateNew,
    );

    if (response.statusCode == 200) {
      return DatasourceResponse(
          data: response.data["data"]["entities"], success: true);
    } else {
      return DatasourceResponse(
          data: response.data["data"]["entities"], success: false);    }
  }

  @override
  Future<DatasourceResponse> getListClients() {
    // TODO: implement getListInfos
    throw UnimplementedError();
  }

  @override
  Future<DatasourceResponse> putInfoClient(
      {required String name, required int active}) {
    // TODO: implement putInfo
    throw UnimplementedError();
  }
}

@override
Future<DatasourceResponse> getListInfos() {
  // TODO: implement getListInfos
  throw UnimplementedError();
}

@override
Future<DatasourceResponse> putInfo(
    {required String name, required int active}) {
  // TODO: implement putInfo
  throw UnimplementedError();
}
