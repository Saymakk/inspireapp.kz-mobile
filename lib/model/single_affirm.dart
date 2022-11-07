class categoriesAff {
  final int id;
  final String title;
  final String icon;
  final List<singleAff> affirmation_texts;

  categoriesAff({
    required this.id,
    required this.icon,
    required this.title,
    required this.affirmation_texts,
  });

  factory categoriesAff.fromJson(Map<String, dynamic> json) {
    return categoriesAff(
      id: json['id'] != null ? (json['id']) : 0,
      icon: json['subcategory_id'] != null ? (json['subcategory_id']) : '',
      title: json['title'] != null ? (json['title']) : '',
      affirmation_texts: (json['affirmation_texts'] as List ?? []).map((c) {
        return singleAff.fromJson(c);
      }).toList(),

    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'icon': icon,
        'affirmation_texts': affirmation_texts,
      };
}

class affirm {
  final List<singleAff> affirmation_texts;

  affirm({
    required this.affirmation_texts,
  });

  factory affirm.fromJson(Map<String, dynamic> shop) {
    return affirm(
      affirmation_texts: (affirm as List).map((c) {
        return singleAff.fromJson(c);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'affirmation_texts ': affirmation_texts,
  };
}

class singleAff {
  final int id;
  final int affirmation_category_id;
  final String text;
  final int delay;

  singleAff({
    required this.id,
    required this.affirmation_category_id,
    required this.text,
    required this.delay,
  });

  factory singleAff.fromJson(Map<String, dynamic> json) {
    return singleAff(
      id: json['id'] != null ? (json['id']) : 0,
      affirmation_category_id:
      json['affirmation_category_id'] != null ? (json['id']) : 0,
      text: json['text'] != null ? (json['text']) : '',
      delay: json['delay'] != null ? (json['delay']) : 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'affirmation_category_id': affirmation_category_id,
    'text': text,
    'delay': delay,
  };
}
