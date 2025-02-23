
import 'other_data.dart';

class Document {
  final String file;

  const Document({required this.file});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      file: json['file'],
    );
  }

  Map<String, dynamic> toJson() => {
    'file': file,
  };
}
