import 'package:app_menezes/app/data/repositories_impl/clients/clients_repository_impl.dart';
import 'package:dartz/dartz.dart';
import '../../../core/failure.dart';
import '../../data/models/clients/get_all_clients_model.dart';

class GetAllClientsUseCase  {
  GetAllClientsUseCase({ required this.repository});
  final ClientsRepositoryImpl repository;


    Future<Either<Failure, EntityList >> getListClients(int? id) async {
    return repository.getListClients(id);
  }
}