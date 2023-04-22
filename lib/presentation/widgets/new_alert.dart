import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nova/data/models/new_device_model.dart';

import '../../core/app_colors/app_colors.dart';
import '../../core/app_constants.dart';
import '../../core/assets_path/fonts_path.dart';

class NewAddDeviceNameAlertDialog extends StatefulWidget{
  final NewDeviceModel newDeviceModel;
  const  NewAddDeviceNameAlertDialog({super.key, required this.newDeviceModel, });

  @override
  State<NewAddDeviceNameAlertDialog> createState() => _NewAddDeviceNameAlertDialogState();
}

class _NewAddDeviceNameAlertDialogState extends State<NewAddDeviceNameAlertDialog> {
  final TextEditingController controller = TextEditingController();

  String updatedStringRef = '';
  @override
  void initState() {
    controller.text = widget.newDeviceModel.deviceName??'';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.r))),
      content: SizedBox(
        width: 301.w,
        height: 200.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Device Name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: FontsPath.tajawalRegular,
                  fontSize: 18.sp,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            ElevatedButton(
              onPressed: () async{
                if(controller.text.isNotEmpty){
                  final ref =
                  await FirebaseDatabase.instance.ref().child("users/$username/newTest").get();
                  String reference0 = ref.value.toString();
                  List str = reference0.split("-").toList();
                  str.replaceRange((int.parse(widget.newDeviceModel.deviceNameIdx!)+1), (int.parse(widget.newDeviceModel.deviceNameIdx!)+2), [controller.text].toList());
                  List updatedRefList = str.map((e) => "$e").toList();
                  updatedStringRef = updatedRefList.join("-");
                  FirebaseDatabase.instance.ref().update({"users/$username/newTest": updatedStringRef}).whenComplete(() {
                    controller.clear();
                    Navigator.pop(context);
                  });
                }else {
                  Fluttertoast.showToast(msg: 'يجب ادخال الاسم');
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r)),
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 5.h)),
              child: Center(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontsPath.tajawalBold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
