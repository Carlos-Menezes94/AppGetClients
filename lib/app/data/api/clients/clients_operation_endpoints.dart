class ClientOperationEndpoints {
  String listClientsEndpoint() =>
      'https://sys-dev.searchandstay.com:443/api/admin/house_rules';

  String deleteClientEndpoint(int? id) =>
      'https://sys-dev.searchandstay.com:443/api/admin/house_rules/${id}';

 String putClientEndpoint(int id) =>
  'https://sys-dev.searchandstay.com:443/api/admin/house_rules/$id';
}
