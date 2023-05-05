import 'package:app_menezes/core/response.dart';
import 'package:dio/dio.dart';
import '../../../../core/interceptor.dart';
import '../../api/clients/clients_operation_endpoints.dart';
import '../../models/clients/create_response_model.dart';
import '../../models/clients/edit_info_client_model.dart';
import 'clients_datasource_abstract.dart';

class ClientsDataSourceImpl implements ClientsDataSourceAbstract {
  @override
  Future<DatasourceResponse> createNewClient(
      {required CreateNewClientModel data}) async {
    final dio = Dio();
    dio.interceptors.add(TokenInterceptor());

    final dataCreateInfo = data.toJson();
    final response = await dio.post(
        ClientOperationEndpoints().listClientsEndpoint(),
        queryParameters: {},
        data: dataCreateInfo);

    if (response.statusCode == 200) {
      return DatasourceResponse(data: response.data["data"], success: true);
    } else {
      return DatasourceResponse(data: response.data["data"], success: false);
    }
  }

  @override
  Future<DatasourceResponse> deleteClient({required int id}) async {
    final dio = Dio();
    dio.interceptors.add(TokenInterceptor());

    final response = await dio.delete(
      ClientOperationEndpoints().deleteClientEndpoint(id),
    );

    if (response.statusCode == 200) {
      return DatasourceResponse(data: response.data, success: true);
    } else {
      return DatasourceResponse(data: response.data, success: false);
    }
  }

  @override
  Future<DatasourceResponse> getClientWithId(
      {int? id, bool? changePage}) async {


    final dio = Dio();
    dio.interceptors.add(TokenInterceptor());

    final response = await dio.get(
        ClientOperationEndpoints().listClientsEndpoint(),
        queryParameters: {"page": changePage! ? 1 : 2});

    if (response.statusCode == 200) {
      return DatasourceResponse(
          data: response.data, success: true);
    } else {
      return DatasourceResponse(
          data: response.data, success: false);
    }
  }

  @override
  Future<DatasourceResponse> getListClients() {
    // TODO: implement getListInfos
    throw UnimplementedError();
  }

  @override
  Future<DatasourceResponse> putInfoClient(
      {required EditInfoModel data, required int id}) async {
    final dio = Dio();
    dio.interceptors.add(TokenInterceptor());

    final dataEditInfo = data.toJson();
    final response = await dio.put(
        ClientOperationEndpoints().putClientEndpoint(id),
        data: dataEditInfo);

    if (response.statusCode == 200) {
      return DatasourceResponse(data: response.data, success: true);
    } else {
      return DatasourceResponse(data: response.data, success: false);
    }
  }
}
