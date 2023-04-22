import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/assets_path/fonts_path.dart';
import '../../data/models/new_device_model.dart';
import 'custom_switch_button.dart';
import 'new_alert.dart';

class DeviceControllerWidget extends StatelessWidget {
  final NewDeviceModel newDeviceModel;
  const DeviceControllerWidget({Key? key, required this.newDeviceModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              showDialog(context: context, builder: (context)=>NewAddDeviceNameAlertDialog(newDeviceModel: newDeviceModel,));
            },
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  newDeviceModel.deviceName??'Device Name',
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: FontsPath.tajawalRegular,
                      fontSize: 18.sp),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 20.w,),
        CustomSwitchButton( newDeviceModel: newDeviceModel,),
      ],
    );
  }
}
