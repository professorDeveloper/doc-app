
import 'staff_specialization.dart';
import 'other_data.dart';

class StaffRequest {
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

  const StaffRequest({
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

  factory StaffRequest.fromJson(Map<String, dynamic> json) {
    return StaffRequest(
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
      staffSpecializations: (json['staff_specializations'] as List<dynamic>)
          .map((e) => StaffSpecialization.fromJson(e))
          .toList(),
      otherDatas: (json['other_datas'] as List<dynamic>)
          .map((e) => OtherData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
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
    'staff_specializations': staffSpecializations.map((e) => e.toJson()).toList(),
    'other_datas': otherDatas.map((e) => e.toJson()).toList(),
  };
}
    