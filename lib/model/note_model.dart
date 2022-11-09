class noteModel {
  final int id;
  final int user_id;
  final String title;
  final String description;
  final String profile_photo_path;
  final String emoji;
  final String profile_photo_url;
  final String created_at;

  noteModel({
    required this.id,
    required this.user_id,
    required this.title,
    required this.description,
    required this.profile_photo_path,
    required this.emoji,
    required this.profile_photo_url,
    required this.created_at,
  });

  factory noteModel.fromJson(Map<String, dynamic> json) {
    return noteModel(
      id: json['id'] != null ? (json['id']) : 0,
      user_id: json['user_id'] != null ? (json['user_id']) : 0,
      title: json['title'] != null ? (json['title']) : '',
      description: json['description'] != null ? (json['description']) : '',
      profile_photo_path: json['profile_photo_path'] != null
          ? (json['profile_photo_path'])
          : '',
      emoji: json['emoji'] != null ? (json['emoji']) : '',
      created_at: json['created_at'] != null ? (json['created_at']) : '',
      profile_photo_url:
          json['profile_photo_url'] != null ? (json['profile_photo_url']) : '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': user_id,
        'title': title,
        'description': description,
        'profile_photo_path': profile_photo_path,
        'emoji': emoji,
        'profile_photo_url': profile_photo_url,
        'created_at': created_at,
      };
}
