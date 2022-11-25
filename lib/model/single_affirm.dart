class categoriesAff {
  final int id;
  final int subcategory_id;
  final int length;
  final int category_id;
  final String icon;
  final String title;
  final String picture;
  final String path;
  final String description;
  final dynamic subcategory;

  categoriesAff({
    required this.id,
    required this.subcategory_id,
    required this.length,
    required this.path,
    required this.title,
    required this.subcategory,
    required this.category_id,
    required this.icon,
    required this.picture,
    required this.description,
  });

  factory categoriesAff.fromJson(Map<String, dynamic> json) {
    return categoriesAff(
      id: json['id'] != null ? (json['id']) : 0,
      category_id: json['category_id'] != null ? (json['category_id']) : 0,
      subcategory_id:
          json['subcategory_id'] != null ? (json['subcategory_id']) : 0,
      length: json['length'] != null ? (json['length']) : 0,
      path: json['path'] != null ? (json['path']) : '',
      title: json['title'] != null ? (json['title']) : '',
      icon: json['icon'] != null ? (json['icon']) : '',
      picture: json['picture'] != null ? (json['picture']) : '',
      subcategory: json['subcategory'] != null ? (json['subcategory']) : '',
      description: json['description'] != null ? (json['description']) : '',
      // subcategory: (json['subcategory'] as List ?? []).map((c) {
      //   return singleAff.fromJson(c);
      // }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'subcategory_id': subcategory_id,
        'length': length,
        'title': title,
        'path': path,
        'subcategory': subcategory,
        'category_id': category_id,
        'icon': icon,
        'picture': picture,
        'description': description,
      };
}

class affirm {
  final List<singleAff> subcategory;

  affirm({
    required this.subcategory,
  });

  factory affirm.fromJson(Map<String, dynamic> shop) {
    return affirm(
      subcategory: (affirm as List).map((c) {
        return singleAff.fromJson(c);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'subcategory ': subcategory,
      };
}

class singleAff {
  final int id;
  final int category_id;
  final String title;
  final String icon;

  singleAff({
    required this.id,
    required this.category_id,
    required this.title,
    required this.icon,
  });

  factory singleAff.fromJson(Map<String, dynamic> json) {
    return singleAff(
      id: json['id'] != null ? (json['id']) : 0,
      category_id: json['category_id'] != null ? (json['category_id']) : 0,
      icon: json['icon'] != null ? (json['icon']) : '',
      title: json['title'] != null ? (json['title']) : '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'category_id': category_id,
        'icon': icon,
        'title': title,
      };
}
