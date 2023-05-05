import 'package:app_menezes/app/domain/usecases/delete_client_use_case.dart';
import 'package:app_menezes/app/domain/usecases/get_all_clients_use_case.dart';
import 'package:app_menezes/app/presentation/controllers/clients_controller.dart';
import 'package:app_menezes/app/presentation/stores/clients_store.dart';
import 'package:get_it/get_it.dart';
import 'package:app_menezes/app/data/repositories_impl/clients/clients_repository_impl.dart';
import '../data/datasources/clients/clients_datasource_impl.dart';
import '../domain/usecases/create_client_use_case.dart';
import '../domain/usecases/put_info_client_use_case.dart';

class DiContainer {
  static void start() {
    GetIt getIt = GetIt.instance;

    getIt.registerFactory(() => ClientsDataSourceImpl());
    getIt.registerFactory(() => ClientsRepositoryImpl(
          dataSource: GetIt.I.get<ClientsDataSourceImpl>(),
        ));
    getIt.registerFactory(
      () => ClientsControler(
          getAllClientsUseCase: GetIt.I.get<GetAllClientsUseCase>(),
          store: GetIt.I.get<ClientStore>(),
          creatInfoDataUseCase: GetIt.I.get<CreateClientUseCase>(),
          deleteClientUseCase: GetIt.I.get<DeleteClientUseCase>(),
          putInfoClientUseCase: GetIt.I.get<PutInfoClientUseCase>()),
    );
    getIt.registerFactory(
      () => GetAllClientsUseCase(
          repository: GetIt.I.get<ClientsRepositoryImpl>()),
    );
    getIt.registerFactory(
      () =>
          CreateClientUseCase(repository: GetIt.I.get<ClientsRepositoryImpl>()),
    );
    getIt.registerFactory(
      () =>
          DeleteClientUseCase(repository: GetIt.I.get<ClientsRepositoryImpl>()),
    );
    getIt.registerFactory(
      () => PutInfoClientUseCase(
          repository: GetIt.I.get<ClientsRepositoryImpl>()),
    );
    getIt.registerSingleton(ClientStore());
  }
}
