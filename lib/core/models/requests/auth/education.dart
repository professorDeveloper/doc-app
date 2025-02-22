
import 'diploma.dart';

class Education {
  final String universityName;
  final int startYear;
  final int endYear;
  final int degree;
  final List<Diploma> diplomas;

  const Education({
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
      diplomas: (json['diplomas'] as List<dynamic>)
          .map((e) => Diploma.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'university_name': universityName,
    'start_year': startYear,
    'end_year': endYear,
    'degree': degree,
    'diplomas': diplomas.map((e) => e.toJson()).toList(),
  };
}
    