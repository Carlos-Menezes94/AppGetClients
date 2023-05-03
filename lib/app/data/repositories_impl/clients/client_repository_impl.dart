import 'package:app_menezes/app/domain/failures/cant_get_client_not_found_failure.dart';
import 'package:app_menezes/core/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/repositories_abst/client_repository_abstract.dart';
import '../../datasources/clients/clients_gym_datasource_impl.dart';
import '../../models/clients/create_response_model.dart';
import '../../models/clients/get_all_clients_model.dart';

class InfoRepositoryImpl implements InfoRepositoryAbstract {
  InfoRepositoryImpl({required this.dataSource});
  final ClientsGymDataSourceImpl dataSource;
  @override
  Future<Either<Failure, EntityList>> getListClients(int? id) async {
    try {
      final response = await dataSource.getClientWithId();
      if (response.success) {
        return Right(EntityList.fromJson(response.data));
      } else {
        return Left(CantGetClientNotFoundFailure());
      }
    } catch (e) {
      return Left(CantGetClientNotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, CreateNewClientModel>> createNewClient(
   CreateNewClientModel data) async {
    final response = await dataSource.createNewClient(  data: data);
    try {
      if (response.success) {
        return Right(CreateNewClientModel.fromJson(response.data));
      } else {
        return Left(CantGetClientNotFoundFailure());
      }
    } catch (e) {
      return Left(CantGetClientNotFoundFailure());
    }
  }
}
