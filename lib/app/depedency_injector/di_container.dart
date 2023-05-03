import 'package:app_menezes/app/domain/usecases/get_all_clients_use_case.dart';
import 'package:app_menezes/app/presentation/controllers/client_controller.dart';
import 'package:app_menezes/app/presentation/stores/client_store.dart';
import 'package:get_it/get_it.dart';
import 'package:app_menezes/app/data/repositories_impl/clients/client_repository_impl.dart';
import '../data/datasources/clients/clients_gym_datasource_impl.dart';
import '../domain/usecases/create_cliente_use_case.dart';

class DiContainer {
  static void start() {
    GetIt getIt = GetIt.instance;

    getIt.registerFactory(() => ClientsGymDataSourceImpl());
    getIt.registerFactory(() => InfoRepositoryImpl(
          dataSource: GetIt.I.get<ClientsGymDataSourceImpl>(),
        ));
    getIt.registerFactory(
      () => ClientControler(
          infoUseCase: GetIt.I.get<InfoUseCase>(),
          store: GetIt.I.get<ClientStore>(),
          creatInfoDataUseCase: GetIt.I.get<CreateClientUseCase>()),
    );
    getIt.registerFactory(
      () => InfoUseCase(repository: GetIt.I.get<InfoRepositoryImpl>()),
    );
    getIt.registerFactory(
      () => CreateClientUseCase(repository: GetIt.I.get<InfoRepositoryImpl>()),
    );
    getIt.registerSingleton(ClientStore());
    // getIt.registerFactory(() => InfoUseCase());
  }
}
