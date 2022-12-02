class categoriesAff {
  final int id;
  final int subcategory_id;
  final int length;
  final int category_id;
  final int contents_count;
  final String icon;
  final String title;
  final String picture;
  final String path;
  final String description;
  final String affirmation_texts;
  final dynamic subcategory;
  final dynamic contents;

  categoriesAff({
    required this.id,
    required this.subcategory_id,
    required this.contents_count,
    required this.length,
    required this.path,
    required this.title,
    required this.subcategory,
    required this.contents,
    required this.category_id,
    required this.icon,
    required this.picture,
    required this.description,
    required this.affirmation_texts,
  });

  factory categoriesAff.fromJson(Map<String, dynamic> json) {
    return categoriesAff(
      id: json['id'] ?? 0,
      contents_count: json['contents_count'] ?? 0,
      category_id: json['category_id'] ?? 0,
      subcategory_id:
          json['subcategory_id'] ?? 0,
      length: json['length'] ?? 0,
      path: json['path'] ?? '',
      title: json['title'] ?? '',
      icon: json['icon'] ?? '',
      picture: json['picture'] ?? '',
      subcategory: json['subcategory'] ?? '',
      contents: json['contents'] ?? '',
      description: json['description'] ?? '',
      affirmation_texts: json['affirmation_texts'] ?? '',
      // subcategory: (json['subcategory'] as List ?? []).map((c) {
      //   return singleAff.fromJson(c);
      // }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'subcategory_id': subcategory_id,
        'contents_count': contents_count,
        'length': length,
        'title': title,
        'path': path,
        'subcategory': subcategory,
        'category_id': category_id,
        'icon': icon,
        'picture': picture,
        'description': description,
        'contents': contents,
        'affirmation_texts': affirmation_texts,
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
