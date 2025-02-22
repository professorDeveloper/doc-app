import 'dart:io';

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
}
