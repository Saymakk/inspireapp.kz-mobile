class citiesListModel {
  final int id;
  final int country_id;
  final String title;

  citiesListModel({
    required this.id,
    required this.country_id,
    required this.title,
  });

  factory citiesListModel.fromJson(Map<String, dynamic> json) {
    return citiesListModel(
      id: json['id'] != '' ? json['id'] : 0,
      title: json['title'] != '' ? json['title'] : '',
      country_id: json['country_id'] != null ? json['country_id'] : 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'country_id': country_id,
      };
}
