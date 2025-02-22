
import 'education.dart';

class StaffSpecialization {
  final int specialization;
  final int experience;
  final List<Education> educations;

  const StaffSpecialization({
    required this.specialization,
    required this.experience,
    required this.educations,
  });

  factory StaffSpecialization.fromJson(Map<String, dynamic> json) {
    return StaffSpecialization(
      specialization: json['specialization'],
      experience: json['experience'],
      educations: (json['educations'] as List<dynamic>)
          .map((e) => Education.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'specialization': specialization,
    'experience': experience,
    'educations': educations.map((e) => e.toJson()).toList(),
  };
}
    