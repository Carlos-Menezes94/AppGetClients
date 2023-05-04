import 'package:app_menezes/app/data/repositories_impl/clients/clients_repository_impl.dart';
import 'package:dartz/dartz.dart';
import '../../../core/failure.dart';

class DeleteClientUseCase {
  DeleteClientUseCase({required this.repository});
  final ClientsRepositoryImpl repository;

  Future<Either<Failure, String>> deleteClient(
    {required int id}) async {
    return repository.deleteClient(id);
  }
}
