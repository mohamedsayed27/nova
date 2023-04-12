import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/data/models/home_device_data_model.dart';

import '../../core/app_colors/app_colors.dart';
import '../../core/assets_path/fonts_path.dart';

class AddDeviceNameAlertDialog extends StatefulWidget{
  final HomeDeviceDataModel? homeDeviceDataModel;
  const  AddDeviceNameAlertDialog({super.key, required this.homeDeviceDataModel});

  @override
  State<AddDeviceNameAlertDialog> createState() => _AddDeviceNameAlertDialogState();
}

class _AddDeviceNameAlertDialogState extends State<AddDeviceNameAlertDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.homeDeviceDataModel?.deviceName??'';
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
            ElevatedButton(
              onPressed: () async{
                FirebaseDatabase.instance.ref().update({"users/doha/devices/${widget.homeDeviceDataModel!.deviceNodeName}/name": controller.text}).whenComplete(() {
                  controller.clear();
                  Navigator.pop(context);
                });

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
