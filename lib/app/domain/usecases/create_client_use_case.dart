import 'package:app_menezes/app/data/repositories_impl/clients/clients_repository_impl.dart';
import 'package:dartz/dartz.dart';
import '../../../core/failure.dart';
import '../../data/models/clients/create_response_model.dart';

class CreateClientUseCase {
  CreateClientUseCase({required this.repository});
  final ClientsRepositoryImpl repository;

  Future<Either<Failure, CreateNewClientModel>> creatInfoData(
    {required CreateNewClientModel data}) async {
    return repository.createNewClient(data);
  }
}
