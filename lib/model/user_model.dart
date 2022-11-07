class userData {
  final Map data;
  final bool success;
  final String token;
  final Map user;
  final int id;
  final bool isActive;
  final String code;
  final String name;
  final String last_name;
  final String description;
  final int city_id;
  final String phone;
  final String email;
  final String email_verified_at;
  final String two_factor_confirmed_at;
  final String current_team_id;
  final String profile_photo_path;
  final String profile_photo_url;
  final String full_name;

  userData({
    required this.data,
    required this.success,
    required this.token,
    required this.user,
    required this.id,
    required this.isActive,
    required this.code,
    required this.name,
    required this.last_name,
    required this.description,
    required this.city_id,
    required this.phone,
    required this.email,
    required this.email_verified_at,
    required this.two_factor_confirmed_at,
    required this.current_team_id,
    required this.profile_photo_path,
    required this.profile_photo_url,
    required this.full_name,

  });

  factory userData.fromJson(Map<String, dynamic> json) {
    return userData(
     data: json['data'] != null ? json['data'] : '',
     success: json['success'] != null ? json['success'] : '',
     token: json['token'] != null ? json['token'] : '',
     user: json['user'] != null ? json['user'] : '',
     id: json['id'] != null ? json['id'] : '',
     isActive: json['isActive'] != null ? json['isActive'] : '',
     code: json['code'] != null ? json['code'] : '',
     name: json['name'] != null ? json['name'] : '',
     last_name: json['last_name'] != null ? json['last_name'] : '',
     description: json['description'] != null ? json['description'] : '',
     city_id: json['city_id'] != null ? json['city_id'] : '',
     phone: json['phone'] != null ? json['phone'] : '',
     email: json['email'] != null ? json['email'] : '',
     email_verified_at: json['email_verified_at'] != null ? json['email_verified_at'] : '',
     two_factor_confirmed_at: json['two_factor_confirmed_at'] != null ? json['two_factor_confirmed_at'] : '',
     current_team_id: json['current_team_id'] != null ? json['current_team_id'] : '',
      profile_photo_path: json['profile_photo_path'] != null ? json['profile_photo_path'] : '',
      profile_photo_url: json['profile_photo_url'] != null ? json['profile_photo_url'] : '',
      full_name: json['full_name'] != null ? json['full_name'] : '',
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data,
    'success': success,
    'token': token,
    'user': user,
    'id': id,
    'isActive': isActive,
    'code': code,
    'name': name,
    'last_name': last_name,
    'description': description,
    'city_id': city_id,
    'phone': phone,
    'email': email,
    'email_verified_at': email_verified_at,
    'two_factor_confirmed_at': two_factor_confirmed_at,
    'current_team_id': current_team_id,
    'profile_photo_path': profile_photo_path,
    'profile_photo_url': profile_photo_url,
    'full_name': full_name,
  };
}

class user {
  final List<userData> data;

  user({
    required this.data,
  });

  factory user.fromJson(Map<String, dynamic> shop) {
    return user(
      data: (user as List).map((c) {
        return userData.fromJson(c);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'data ': data,
  };
}
