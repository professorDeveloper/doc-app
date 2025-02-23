import 'education.dart';

class StaffSpecialization {
  final int specialization;
  final List<int> selectedservices;
  final int experience;
  final List<Education> educations;

  const StaffSpecialization({
    required this.specialization,
    required this.selectedservices,
    required this.experience,
    required this.educations,
  });

  factory StaffSpecialization.fromJson(Map<String, dynamic> json) {
    return StaffSpecialization(
      specialization: json['specialization'] ?? 0,
      selectedservices: (json['services'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList() ??
          [],
      experience: json['experience'] ?? 0,
      educations: (json['educations'] as List<dynamic>?)
          ?.map((e) => Education.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'specialization': specialization,
    'experience': experience,
    'services': selectedservices,
    'educations': educations.map((e) => e.toJson()).toList(),
  };
}
