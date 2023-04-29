import '../../core/response.dart';


abstract class InfoDataSourceAbstract {
Future <DatasourceResponse> getListInfos();
Future <DatasourceResponse> getInfoWithId({required int id});
Future <DatasourceResponse> createNewInfo({required String name, required int active});
Future <DatasourceResponse> deleteInfoWithId({required int id});
Future <DatasourceResponse> putInfo({required String name, required int active});



}