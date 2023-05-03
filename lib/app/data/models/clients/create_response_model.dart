

class CreateNewClientModel {
  int? id;
  String name;
  int active;
  int? order;

  CreateNewClientModel({
    required this.id,
    required this.name,
    required this.active,
    this.order,
  });

  factory CreateNewClientModel.fromJson(Map<String, dynamic> json) {
    return CreateNewClientModel(
      id: json['id'],
      name: json['name'],
      active: json['active'],
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['active'] = active;
    return {'house_rules': data};
  }
}
