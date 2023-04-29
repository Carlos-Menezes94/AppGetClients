class HouseRule {
  String name;
  int active;

  HouseRule({
    required this.name,
    required this.active,
  });

  factory HouseRule.fromJson(Map<String, dynamic> json) {
    return HouseRule(
      name: json['house_rules']['name'],
      active: json['house_rules']['active'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['house_rules'] = {
      'name': name,
      'active': active,
    };
    return data;
  }
}