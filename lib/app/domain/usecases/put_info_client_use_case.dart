import 'package:app_menezes/app/data/repositories_impl/clients/clients_repository_impl.dart';
import 'package:dartz/dartz.dart';
import '../../../core/failure.dart';
import '../../data/models/clients/create_response_model.dart';
import '../../data/models/clients/edit_info_client_model.dart';

class PutInfoClientUseCase {
  PutInfoClientUseCase({required this.repository});
  final ClientsRepositoryImpl repository;

  Future<Either<Failure, EditInfoModel>> putInfoClient(
      {required EditInfoModel data, int? id}) async {
    return repository.putInfoClient(data, id);
  }
}
