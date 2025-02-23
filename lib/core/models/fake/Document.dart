import 'dart:convert';
import 'dart:io';

import 'package:doc_app/core/models/requests/auth/other_data.dart';
import 'package:doc_app/core/models/requests/auth/document.dart';

class FakeDocument {
  String name;
  File image;
  String startDate;
  String endDate;

  FakeDocument(
      {required this.name,
      required this.image,
      required this.startDate,
      required this.endDate});
  OtherData toOtherData() {
    // Faylni o'qib, base64 formatiga o'girish
    final bytes = image.readAsBytesSync();
    final base64String = base64Encode(bytes);

    // OtherData modelini qaytarish
    return OtherData(
      name: name,
      startYear: int.parse(startDate),
      endYear: int.parse(endDate),
      documents: [
        Document(file: base64String),
      ],
    );
  }

}

