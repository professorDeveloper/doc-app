
import 'document.dart';

class OtherData {
  final String name;
  final int startYear;
  final int endYear;
  final List<Document> documents;

  const OtherData({
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
      documents: (json['documents'] as List<dynamic>)
          .map((e) => Document.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'start_year': startYear,
    'end_year': endYear,
    'documents': documents.map((e) => e.toJson()).toList(),
  };
}
    