import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/assets_path/fonts_path.dart';
import 'add_device_name_dialog.dart';
import 'custom_switch_button.dart';

class DeviceControllerWidget extends StatefulWidget {
  const DeviceControllerWidget({Key? key}) : super(key: key);

  @override
  State<DeviceControllerWidget> createState() => _DeviceControllerWidgetState();
}

class _DeviceControllerWidgetState extends State<DeviceControllerWidget> {
  String? duration;
  String deviceName = 'Device Name';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            // showDialog(context: context, builder: (context)=>AddImageAlertDialog(name: deviceName,)).then((value){setState(() {
            //
            // });});
          },
          child: Container(
            height: 60.h,
            width: 120.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                'Device Name',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: FontsPath.tajawalRegular,
                    fontSize: 18.sp),
              ),
            ),
          ),
        ),
        const CustomSwitchButton(),
        InkWell(
          onTap: () {
            showDurationPicker(
              context: context,
              initialTime: const Duration(minutes: 30),
            ).then((value) {
              setState(() {
                duration = value.toString().substring(0, 1) != "0"
                    ? "${value.toString().substring(0, 4)} H:M"
                    : !value.toString().substring(2, 4).startsWith("0")
                        ? "${value.toString().substring(2, 4)} Minutes"
                        : "${value.toString().substring(3, 4)} Minutes";
              });
            }).catchError((onError) {
              return;
            });
          },
          child: Container(
            height: 60.h,
            width: 120.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                duration ?? 'Time',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: FontsPath.tajawalRegular,
                    fontSize: 18.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
