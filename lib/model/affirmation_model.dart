class affirmationsList {
  final int id;
  final String title;
  final String icon;

  affirmationsList({
    required this.id,
    required this.icon,
    required this.title,
  });

  factory affirmationsList.fromJson(Map<String, dynamic> json) {
    return affirmationsList(
      id: json['id'] != null ? (json['id']) : 0,
      icon: json['icon'] != null ? (json['icon']) : '',
      title: json['title'] != null ? (json['title']) : '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'icon': icon,
      };
}
