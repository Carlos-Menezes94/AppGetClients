import 'package:app_menezes/core/response.dart';

import 'info_datasource_abstract.dart';

class InfoDataSourceImpl implements InfoDataSourceAbstract{
  @override
  Future<DatasourceResponse> createNewInfo({required String name, required int active}) {
    // TODO: implement createNewInfo
    throw UnimplementedError();
  }

  @override
  Future<DatasourceResponse> deleteInfoWithId({required int id}) {
    // TODO: implement deleteInfoWithId
    throw UnimplementedError();
  }

  @override
  Future<DatasourceResponse> getInfoWithId({required int id}) {
    // TODO: implement getInfoWithId
    throw UnimplementedError();
  }

  @override
  Future<DatasourceResponse> getListInfos() {
    // TODO: implement getListInfos
    throw UnimplementedError();
  }

  @override
  Future<DatasourceResponse> putInfo({required String name, required int active}) {
    // TODO: implement putInfo
    throw UnimplementedError();
  }
}