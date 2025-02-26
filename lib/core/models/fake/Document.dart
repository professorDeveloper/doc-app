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
    // Fayl kengaytmasini olish va MIME turini aniqlash
    String extension = image.path.split('.').last.toLowerCase();
    String mimeType = "data:image/jpeg;base64,"; // Default to JPEG

    if (extension == "png") {
      mimeType = "data:image/png;base64,";
    } else if (extension == "jpg" || extension == "jpeg") {
      mimeType = "data:image/jpeg;base64,";
    } else if (extension == "gif") {
      mimeType = "data:image/gif;base64,";
    } else if (extension == "pdf") {
      mimeType = "data:application/pdf;base64,";
    }

    // Faylni o'qib, base64 formatiga o'girish
    final bytes = image.readAsBytesSync();
    final base64String = base64Encode(bytes);

    // MIME turi bilan birlashtirish
    String encodedFile = "$mimeType$base64String";

    // OtherData modelini qaytarish
    return OtherData(
      name: name,
      startYear: int.parse(startDate),
      endYear: int.parse(endDate),
      documents: [
        Document(file: encodedFile),
      ],
    );
  }

}

