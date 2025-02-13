import 'dart:convert';

class AuthResponse {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final User user;

  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      tokenType: json['token_type'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'token_type': tokenType,
      'user': user.toJson(),
    };
  }
}

class User {
  final int id;
  final String phone;
  final String? fullName;
  final String? email;
  final String? jshshr;
  final String? birthday;
  final String? gender;
  final String dateJoined;
  final String lastLogin;

  User({
    required this.id,
    required this.phone,
    this.fullName,
    this.email,
    this.jshshr,
    this.birthday,
    this.gender,
    required this.dateJoined,
    required this.lastLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      phone: json['phone'],
      fullName: json['full_name'],
      email: json['email'],
      jshshr: json['jshshr'],
      birthday: json['birthday'],
      gender: json['gender'],
      dateJoined: json['date_joined'],
      lastLogin: json['last_login'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'full_name': fullName,
      'email': email,
      'jshshr': jshshr,
      'birthday': birthday,
      'gender': gender,
      'date_joined': dateJoined,
      'last_login': lastLogin,
    };
  }
}
