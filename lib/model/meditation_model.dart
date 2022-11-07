class meditationsList {
  final int id;
  final int subcategory_id;
  final String title;
  final String description;
  final String path;
  final int length;

  meditationsList({
    required this.id,
    required this.subcategory_id,
    required this.title,
    required this.description,
    required this.path,
    required this.length,

  });

  factory meditationsList.fromJson(Map<String, dynamic> json) {
    return meditationsList(
      id: json['id'] != null ? (json['id']) : 0,
      subcategory_id: json['subcategory_id'] != null ? (json['subcategory_id']) : 0,
      title: json['title'] != null ? (json['title']) : '',
      description: (json['description']) != null ? (json['description']) : '',
      path: json['path'] != null ? (json['path']) : '',
      length: json['length'] != null ?  (json['length']) : 0,

    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'subcategory_id': subcategory_id,
    'title': title,
    'description': description,
    'path': path,
    'length': length,

  };
}

