import 'dart:convert';
import 'dart:io';

import '../requests/auth/diploma.dart';
import '../requests/auth/education.dart';

class DataModel {
  String universityName;
  String studytype;
  String startyear;
  String endyear;
  List<File> imgs;

  DataModel({
    required this.universityName,
    required this.studytype,
    required this.startyear,
    required this.endyear,
    required this.imgs,
  });

  /// CopyWith method for deep copying
  DataModel copyWith({
    String? universityName,
    String? studytype,
    String? startyear,
    String? endyear,
    List<File>? imgs,
  }) {
    return DataModel(
      universityName: universityName ?? this.universityName,
      studytype: studytype ?? this.studytype,
      startyear: startyear ?? this.startyear,
      endyear: endyear ?? this.endyear,
      imgs: imgs ?? List<File>.from(this.imgs), // Deep copy for imgs list
    );
  }

  /// Converting to Map for easier debugging or storage
  Map<String, dynamic> toMap() {
    return {
      'universityName': universityName,
      'studytype': studytype,
      'startyear': startyear,
      'endyear': endyear,
      'imgs': imgs.map((file) => file.path).toList(), // Only paths for easier debugging
    };
  }

  /// Override toString for better logging
  @override
  String toString() {
    return 'DataModel{universityName: $universityName, studytype: $studytype, startyear: $startyear, endyear: $endyear, imgs: ${imgs.map((e) => e.path).toList()}}';
  }
  Education toEducation() => Education(
    universityName: universityName,
    startYear: int.parse(startyear),
    endYear: int.parse(endyear),
    degree: 1,
    diplomas: imgs.map((file) {
      // Get the file extension and determine the MIME type
      String extension = file.path.split('.').last.toLowerCase();
      String mimeType = "data:image/jpeg;base64,"; // Default to JPEG

      if (extension == "png") {
        mimeType = "data:image/png;base64,";
      } else if (extension == "jpg" || extension == "jpeg") {
        mimeType = "data:image/jpeg;base64,";
      } else if (extension == "gif") {
        mimeType = "data:image/gif;base64,";
      }

      // Read the file as bytes and encode as Base64
      final bytes = file.readAsBytesSync();
      final base64String = base64Encode(bytes);

      // Combine the MIME type with the Base64 string
      return Diploma(image: "$mimeType$base64String");
    }).toList(),
  );
}
