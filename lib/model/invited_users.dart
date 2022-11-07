class invitedUsersModel {
  final int id;
  final dynamic isActive;
  final int code;
  final String name;
  // final String last_name;
  // final String description;
  // final int city_id;
  final String phone;
  // final String email;
  final String profile_photo_url;
  final String full_name;
  // final List pivot;


  invitedUsersModel({
    required this.id,
    required this.isActive,
    required this.code,
    required this.name,
    // required this.last_name,
    // required this.description,
    // required this.city_id,
    // required this.email,
    required this.profile_photo_url,
    required this.full_name,
    required this.phone,
    // required this.pivot,

  });

  factory invitedUsersModel.fromJson(Map<String, dynamic> json) {
    return invitedUsersModel(
   id: json['id'] != null ? json['id'] : 0,
   isActive: json['isActive'] != null ? json['isActive'] : '',
   code: json['code'] != 0 ? json['code'] : 0,
   name: json['name'] != null ? json['name'] : '',
   // last_name: json['last_name'] != null ? json['last_name'] : '',
   // description: json['description'] != null ? json['description'] : '',
   // city_id: json['city_id'] != null ? json['city_id'] : '',
   // email: json['email'] != null ? json['email'] : '',
   profile_photo_url: json['profile_photo_url'] != null ? json['profile_photo_url'] : '',
   full_name: json['full_name'] != null ? json['full_name'] : '',
   phone: json['phone'] != null ? json['phone'] : '',
   // pivot: json['pivot'] != null ? json['pivot'] : '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'isActive': isActive,
    'code': code,
    'name': name,
    // 'last_name': last_name,
    // 'description': description,
    // 'city_id': city_id,
    'phone': phone,
    // 'email': email,
    'profile_photo_url': profile_photo_url,
    'full_name': full_name,
    // 'pivot': pivot,
  };
}

