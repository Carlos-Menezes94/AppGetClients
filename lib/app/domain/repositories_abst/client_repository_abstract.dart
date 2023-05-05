import 'package:dartz/dartz.dart';
import '../../../core/failure.dart';
import '../../data/models/clients/create_response_model.dart';
import '../../data/models/clients/edit_info_client_model.dart';
import '../../data/models/clients/get_all_clients_model.dart';

abstract class InfoRepositoryAbstract {
  Future<Either<Failure, GetAllClientsModel>> getListClients(int? id, bool? changePage);
  Future<Either<Failure, CreateNewClientModel>> createNewClient(
      CreateNewClientModel data);
  Future<Either<Failure, String>> deleteClient(int? id);
  Future<Either<Failure, EditInfoModel>> putInfoClient(
      EditInfoModel data, int? id);
}
