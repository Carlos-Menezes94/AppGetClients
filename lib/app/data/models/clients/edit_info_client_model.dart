class EditInfoModel {
  String name;
  int active;

  EditInfoModel({required this.name, required this.active});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['active'] = active;
    return {'house_rules': data};
  }
}
