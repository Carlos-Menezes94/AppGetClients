class GetAllClientsModel {
  bool success;
  HouseRulesData data;
  String message;

  GetAllClientsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory GetAllClientsModel.fromJson(Map<String, dynamic> json) {
    return GetAllClientsModel(
      success: json['success'],
      data: HouseRulesData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class HouseRulesData {
  List<HouseRulesEntity> entities;
  Pagination pagination;

  HouseRulesData({
    required this.entities,
    required this.pagination,
  });

  factory HouseRulesData.fromJson(Map<String, dynamic> json) {
    return HouseRulesData(
      entities: List<HouseRulesEntity>.from(
        json['entities'].map((x) => HouseRulesEntity.fromJson(x)),
      ),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class HouseRulesEntity {
  int id;
  String name;
  int active;
  int order;

  HouseRulesEntity({
    required this.id,
    required this.name,
    required this.active,
    required this.order,
  });

  factory HouseRulesEntity.fromJson(Map<String, dynamic> json) {
    return HouseRulesEntity(
      id: json['id'],
      name: json['name'],
      active: json['active'],
      order: json['order'],
    );
  }
}

class Pagination {
  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;
  Links links;

  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'],
      count: json['count'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
      links: Links.fromJson(json['links']),
    );
  }
}

class Links {
  dynamic next;
  dynamic prev;

  Links({
    required this.next,
    required this.prev,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      next: json['next'],
      prev: json['prev'],
    );
  }
}
