import 'dart:convert';

class UserResponse {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final User user;

  UserResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
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
  final int type;
  final String firstName;
  final String lastName;
  final String phone;
  final String jshshr;
  final String address;
  final String birthday;
  final String gender;
  final String about;
  final String acceptedAge;
  final List<StaffSpecialization> staffSpecializations;
  final List<OtherData> otherDatas;

  User({
    required this.type,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.jshshr,
    required this.address,
    required this.birthday,
    required this.gender,
    required this.about,
    required this.acceptedAge,
    required this.staffSpecializations,
    required this.otherDatas,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      type: json['type'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      jshshr: json['jshshr'],
      address: json['address'],
      birthday: json['birthday'],
      gender: json['gender'],
      about: json['about'],
      acceptedAge: json['accepted_age'],
      staffSpecializations: (json['staff_specializations'] as List)
          .map((e) => StaffSpecialization.fromJson(e))
          .toList(),
      otherDatas: (json['other_datas'] as List)
          .map((e) => OtherData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'jshshr': jshshr,
      'address': address,
      'birthday': birthday,
      'gender': gender,
      'about': about,
      'accepted_age': acceptedAge,
      'staff_specializations':
      staffSpecializations.map((e) => e.toJson()).toList(),
      'other_datas': otherDatas.map((e) => e.toJson()).toList(),
    };
  }
}

class StaffSpecialization {
  final int specialization;
  final List<dynamic> selectedServices;
  final int experience;
  final List<Education> educations;

  StaffSpecialization({
    required this.specialization,
    required this.selectedServices,
    required this.experience,
    required this.educations,
  });

  factory StaffSpecialization.fromJson(Map<String, dynamic> json) {
    return StaffSpecialization(
      specialization: json['specialization'],
      selectedServices: json['selected_services'],
      experience: json['experience'],
      educations: (json['educations'] as List)
          .map((e) => Education.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'specialization': specialization,
      'selected_services': selectedServices,
      'experience': experience,
      'educations': educations.map((e) => e.toJson()).toList(),
    };
  }
}

class Education {
  final String universityName;
  final int startYear;
  final int endYear;
  final int degree;
  final List<Diploma> diplomas;

  Education({
    required this.universityName,
    required this.startYear,
    required this.endYear,
    required this.degree,
    required this.diplomas,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      universityName: json['university_name'],
      startYear: json['start_year'],
      endYear: json['end_year'],
      degree: json['degree'],
      diplomas: (json['diplomas'] as List)
          .map((e) => Diploma.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'university_name': universityName,
      'start_year': startYear,
      'end_year': endYear,
      'degree': degree,
      'diplomas': diplomas.map((e) => e.toJson()).toList(),
    };
  }
}

class Diploma {
  final String image;

  Diploma({required this.image});

  factory Diploma.fromJson(Map<String, dynamic> json) {
    return Diploma(
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
    };
  }
}

class OtherData {
  final String name;
  final int startYear;
  final int endYear;
  final List<Document> documents;

  OtherData({
    required this.name,
    required this.startYear,
    required this.endYear,
    required this.documents,
  });

  factory OtherData.fromJson(Map<String, dynamic> json) {
    return OtherData(
      name: json['name'],
      startYear: json['start_year'],
      endYear: json['end_year'],
      documents: (json['documents'] as List)
          .map((e) => Document.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'start_year': startYear,
      'end_year': endYear,
      'documents': documents.map((e) => e.toJson()).toList(),
    };
  }
}

class Document {
  final String file;

  Document({required this.file});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      file: json['file'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'file': file,
    };
  }
}
