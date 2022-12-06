class coursesList {
  final int id;
  final String title;
  final int course_id;
  final String path;
  final String material_path;
  final String length;
  final String description;
  final String picture;
  // final List<mini> course_contents;
  final dynamic course_contents;

  coursesList({
    required this.id,
    required this.title,
    required this.course_id,
    required this.path,
    required this.material_path,
    required this.length,
    required this.description,
    required this.picture,
    required this.course_contents,
  });

  factory coursesList.fromJson(Map<String, dynamic> json) {
    return coursesList(
      id: json['id'] != null ? (json['id']) : 0,
      title: json['title'] != null ? (json['title']) : '',
      course_id: json['course_id'] != null ? (json['course_id']) : 0,
      path: json['path'] != null ? (json['path']) : '',
      material_path: json['material_path'] != null ? json['material_path'] : '',
      length: json['length'] != null ? (json['length']) : '',
      description: json['description'] != null ? (json['description']) : '',
      picture: json['picture'] != null ? (json['picture']) : '',
      course_contents: json['course_contents'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'course_id': course_id,
    'path': path,
    'material_path': material_path,
    'length': length,
    'description': description,
    'picture': picture,
    'course_contents': course_contents,
  };
}

class mini {
  final List<coursesList> course_contents;

  mini({
    required this.course_contents,
  });

  factory mini.fromJson(Map<String, dynamic> shop) {
    return mini(
      course_contents: (mini as List).map((c) {
        return coursesList.fromJson(c);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'course_contents ': course_contents,
  };
}
