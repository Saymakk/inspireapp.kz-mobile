class affirmationsList {
  final int id;
  final String title;
  final String icon;
  final String text;

  affirmationsList({
    required this.id,
    required this.icon,
    required this.title,
    required this.text,
  });

  factory affirmationsList.fromJson(Map<String, dynamic> json) {
    return affirmationsList(
      id: json['id'] ?? 0,
      icon: json['icon'] ?? '',
      title: json['title'] ?? '',
      text: json['text'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'icon': icon,
        'text': text,
      };
}
