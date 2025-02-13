class EducationLevel {
  final int id;
  final String name;

  EducationLevel({required this.id, required this.name});

  // JSONdan obyektga o‘girish uchun factory method
  factory EducationLevel.fromJson(Map<String, dynamic> json) {
    return EducationLevel(
      id: json['id'],
      name: json['name'],
    );
  }

  // Obyektni JSON formatiga o‘girish uchun method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

// JSON ro‘yxatini Dart obyektlar ro‘yxatiga o‘girish
List<EducationLevel> parseEducationLevels(List<dynamic> jsonList) {
  return jsonList.map((json) => EducationLevel.fromJson(json)).toList();
}

