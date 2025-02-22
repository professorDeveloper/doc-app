import 'package:doc_app/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAddServicesDialog(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    backgroundColor: AppColor.Gray2,
    context: context,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    isScrollControlled: true,
    builder: (context) => AddServicesDialogVIew(),
  );
}

class AddServicesDialogVIew extends StatefulWidget {
  const AddServicesDialogVIew({super.key});

  @override
  State<AddServicesDialogVIew> createState() => _AddServicesDialogVIewState();
}

class _AddServicesDialogVIewState extends State<AddServicesDialogVIew> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.94,
      child: Container(
        color: AppColor.Gray2,
        child:Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
