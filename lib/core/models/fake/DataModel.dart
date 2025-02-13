
import 'dart:io';

class DataModel{
  String universityName;
  String studytype;
  String startyear;
  String endyear;
  File img;

  DataModel({required this.universityName, required this.studytype, required this.startyear, required this.endyear, required this.img});

  @override
  String toString() {
    return 'DataModel{universityName: $universityName, studytype: $studytype, startyear: $startyear, endyear: $endyear, img: $img}';
  }
}