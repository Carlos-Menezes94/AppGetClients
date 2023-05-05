import '../../../../core/response.dart';
import '../../models/clients/create_response_model.dart';
import '../../models/clients/edit_info_client_model.dart';



abstract class ClientsDataSourceAbstract {
Future <DatasourceResponse> getListClients();
Future <DatasourceResponse> getClientWithId({ int? id, bool? changePage});
Future <DatasourceResponse> createNewClient({required CreateNewClientModel data});
Future <DatasourceResponse> deleteClient({required int id});
Future <DatasourceResponse> putInfoClient({required EditInfoModel data, required int id});



}