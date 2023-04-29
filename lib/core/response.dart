class DatasourceResponse<T> {
  DatasourceResponse({
    required this.success,
    required this.data,
  });
  bool success;
  T data;
}
