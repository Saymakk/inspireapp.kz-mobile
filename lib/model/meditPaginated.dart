import 'meditation_model.dart';

class meditationsListPag {
  final int current_page;
  final List<meditationsList> data;



  meditationsListPag({
    required this.current_page,
    required this.data,

  });


  factory meditationsListPag.fromJson(Map<String, dynamic> json) {
    return meditationsListPag(
      current_page: json['current_page'] != null ? (json['current_page']) : 0,
      data: json['data'] != null ? (json['data']) : '',

    );
  }

  Map<String, dynamic> toJson() => {
    'current_page': current_page,
    'data': data,

  };
}

