import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_constants.dart';
import '../../data/models/new_device_model.dart';

class CustomSwitchButton extends StatefulWidget {
  final NewDeviceModel newDeviceModel;

  const CustomSwitchButton({Key? key, required this.newDeviceModel})
      : super(key: key);

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  late bool isOnOrOff;

  String updatedStringRef = '';

  @override
  Widget build(BuildContext context) {
    isOnOrOff =
        int.parse(widget.newDeviceModel.deviceStatus!) == 1 ? true : false;
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () async {
        setState(() {
          isOnOrOff = !isOnOrOff;
        });
        final ref = await FirebaseDatabase.instance
            .ref()
            .child("users/$username/newTest")
            .get();
        String reference0 = ref.value.toString();
        final updateField = FirebaseDatabase.instance.ref();
        List str = reference0.split("-").toList();
        if (int.parse(widget.newDeviceModel.deviceStatus!) == 1) {
          str.replaceRange(
              (int.parse(widget.newDeviceModel.deviceStatusIdx!) + 1),
              (int.parse(widget.newDeviceModel.deviceStatusIdx!) + 2),
              ['0'].toList());
          List updatedRefList = str.map((e) => "$e").toList();
          updatedStringRef = updatedRefList.join("-");
          updateField.update({
            "users/$username/newTest": updatedStringRef
          }).whenComplete(() {});
        } else {
          str.replaceRange(
              (int.parse(widget.newDeviceModel.deviceStatusIdx!) + 1),
              (int.parse(widget.newDeviceModel.deviceStatusIdx!) + 2),
              ['1'].toList());
          List updatedRefList = str.map((e) => "$e").toList();
          updatedStringRef = updatedRefList.join("-");
          updateField.update({
            "users/$username/newTest": updatedStringRef
          }).whenComplete(() {});
        }
      },
      child: SizedBox(
        width: 65.w,
        height: 40.h,
        child: Stack(
          children: [
            Container(
              width: 65.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: !isOnOrOff ? Colors.white : const Color(0xff4cda64),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(
                  18.r,
                ),
              ),
            ),
            AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              alignment:
                  !isOnOrOff ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 150),
              child: Card(
                elevation: 5,
                margin: EdgeInsets.zero,
                shape: const CircleBorder(),
                child: Container(
                  width: 33.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.r,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
