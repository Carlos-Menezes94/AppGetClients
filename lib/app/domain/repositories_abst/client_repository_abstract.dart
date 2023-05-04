import 'package:dartz/dartz.dart';
import '../../../core/failure.dart';
import '../../data/models/clients/create_response_model.dart';
import '../../data/models/clients/get_all_clients_model.dart';

abstract class InfoRepositoryAbstract {
  Future<Either<Failure, EntityList>> getListClients(int? id);
  Future<Either<Failure, CreateNewClientModel>> createNewClient(
      CreateNewClientModel data);
  Future<Either<Failure, String>> deleteClient(int? id);
}
