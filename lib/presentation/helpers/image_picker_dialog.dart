import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/app_color.dart';
import '../../constants/app_style.dart';

void showImagePickerDialog({required BuildContext context,required  Function(File) onImagePicked}) {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
    Navigator.pop(context); // Dialogni yopish
  }

  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    backgroundColor: Colors.white,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    context: context,
    isScrollControlled: true,
    builder: (context) => FractionallySizedBox(
      heightFactor: 0.2,
      child: Container(
        color: AppColor.Gray1,
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Kamera orqali rasm olish
                MaterialButton(
                  color: AppColor.White,
                  elevation: 0,
                  highlightElevation: 0,
                  focusElevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () => _pickImage(ImageSource.camera),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.camera, color: AppColor.BlueMain, size: 30),
                        Text("Kamera", style: AppStyle.sfproDisplay16Black),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 25),
                // Galereyadan rasm tanlash
                MaterialButton(
                  color: AppColor.White,
                  elevation: 0,
                  highlightElevation: 0,
                  focusElevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.photo, color: AppColor.BlueMain, size: 30),
                        Text("Galleriya", style: AppStyle.sfproDisplay16Black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
