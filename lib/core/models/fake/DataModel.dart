import 'dart:convert';
import 'dart:io';

import 'package:doc_app/core/models/requests/auth/diploma.dart';
import 'package:doc_app/core/models/requests/auth/education.dart';

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
      'imgs': imgs.map((file) => file.path).toList(),
      // Only paths for easier debugging
    };
  }

  /// Override toString for better logging
  @override
  String toString() {
    return 'DataModel{universityName: $universityName, studytype: $studytype, startyear: $startyear, endyear: $endyear, imgs: ${imgs
        .map((e) => e.path).toList()}}';
  }

  Education toEducation() =>
      Education(
          universityName: universityName,
          startYear: int.parse(startyear),
          endYear: int.parse(endyear),
          degree: 1,
          diplomas: imgs.map((file) {
            final bytes = file.readAsBytesSync();
            final base64String = base64Encode(bytes);
            return Diploma(image: base64String);
          }).toList());


}
