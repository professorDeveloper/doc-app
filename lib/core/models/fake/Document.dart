import 'dart:io';

class Document {
  String name;
  File image;
  String startDate;
  String endDate;

  Document(
      {required this.name,
      required this.image,
      required this.startDate,
      required this.endDate});
}
