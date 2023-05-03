class GetAllClientsModel {
  int id;
  String name;
  int active;
  int order;

  GetAllClientsModel({required this.id,required this.name,required this.active,required this.order});

  factory GetAllClientsModel.fromJson(Map<String, dynamic> json) {
    return GetAllClientsModel(
      id: json['id'],
      name: json['name'],
      active: json['active'],
      order: json['order'],
    );
  }
}

class EntityList {
  List<GetAllClientsModel> entities;

  EntityList({required this.entities});

  factory EntityList.fromJson(List<dynamic> json) {
    List<GetAllClientsModel> entitiesList = [];

    entitiesList = json.map((entity) => GetAllClientsModel.fromJson(entity)).toList();

    return EntityList(entities: entitiesList);
  }
}
