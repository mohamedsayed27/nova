import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/data/models/home_device_data_model.dart';

import '../../core/assets_path/fonts_path.dart';
import 'add_device_name_dialog.dart';
import 'custom_switch_button.dart';

class DeviceControllerWidget extends StatelessWidget {
  final HomeDeviceDataModel homeDeviceDataModel;
  const DeviceControllerWidget({Key? key, required this.homeDeviceDataModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            showDialog(context: context, builder: (context)=>AddDeviceNameAlertDialog(name: homeDeviceDataModel.deviceName, nodeName: homeDeviceDataModel.deviceNodeName, changeNameType: "device",));
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
                homeDeviceDataModel.deviceName??'Device Name',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: FontsPath.tajawalRegular,
                    fontSize: 18.sp),
              ),
            ),
          ),
        ),
        CustomSwitchButton(homeDeviceDataModel: homeDeviceDataModel,),
      ],
    );
  }
}
