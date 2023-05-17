import 'package:app_menezes/app/domain/failures/cant_get_client_not_found_failure.dart';
import 'package:app_menezes/core/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/repositories_abst/client_repository_abstract.dart';
import '../../datasources/clients/clients_data_source_impl.dart';
import '../../models/clients/create_response_model.dart';
import '../../models/clients/edit_info_client_model.dart';
import '../../models/clients/get_all_clients_model.dart';

class ClientsRepositoryImpl implements InfoRepositoryAbstract {
  ClientsRepositoryImpl({required this.dataSource});
  final ClientsDataSourceImpl dataSource;
  @override
  Future<Either<Failure, GetAllClientsModel>> getListClients(int? id, bool? changePage) async {
    try {
      final response = await dataSource.getClientWithId(changePage: changePage);
      if (response.success) {
        return Right(GetAllClientsModel.fromJson(response.data));
      } else {
        return Left(CantGetClientNotFoundFailure());
      }
    } catch (error) {
      return Left(CantGetClientNotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, CreateNewClientModel>> createNewClient(
      CreateNewClientModel data) async {
    final response = await dataSource.createNewClient(data: data);
    try {
      if (response.success) {
        return Right(CreateNewClientModel.fromJson(response.data));
      } else {
        return Left(CantGetClientNotFoundFailure());
      }
    } catch (error) {
      return Left(CantGetClientNotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteClient(int? id) async {
    try {
      final response = await dataSource.deleteClient(id: id!);
      if (response.success) {
        return Right(response.data["message"]);
      } else {
        return Left(CantGetClientNotFoundFailure());
      }
    } catch (error) {
      return Left(CantGetClientNotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, EditInfoModel>> putInfoClient(
      EditInfoModel data, int? id) async {
    try {
      final response = await dataSource.putInfoClient(id: id!, data: data);
      if (response.success) {
        return Right(response.data);
      } else {
        return Left(CantGetClientNotFoundFailure());
      }
    } catch (error) {
      return Left(CantGetClientNotFoundFailure());
    }
  }
}
