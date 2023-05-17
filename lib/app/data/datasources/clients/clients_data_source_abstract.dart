import '../../../../core/response.dart';
import '../../models/clients/create_response_model.dart';
import '../../models/clients/edit_info_client_model.dart';



abstract class ClientsDataSourceAbstract {
Future <DataSourceResponse> getListClients();
Future <DataSourceResponse> getClientWithId({ int? id, bool? changePage});
Future <DataSourceResponse> createNewClient({required CreateNewClientModel data});
Future <DataSourceResponse> deleteClient({required int id});
Future <DataSourceResponse> putInfoClient({required EditInfoModel data, required int id});



}