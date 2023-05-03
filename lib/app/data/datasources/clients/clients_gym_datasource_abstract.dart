import '../../../../core/response.dart';
import '../../models/clients/create_response_model.dart';



abstract class ClientsGymDataSourceAbstract {
Future <DatasourceResponse> getListClients();
Future <DatasourceResponse> getClientWithId({ int? id});
Future <DatasourceResponse> createNewClient({required CreateNewClientModel data});
Future <DatasourceResponse> deleteClient({required int id});
Future <DatasourceResponse> putInfoClient({required String name, required int active});



}