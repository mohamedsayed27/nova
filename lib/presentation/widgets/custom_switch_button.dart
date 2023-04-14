import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/app_constants.dart';
import 'package:nova/data/models/home_device_data_model.dart';

class CustomSwitchButton extends StatefulWidget {
  final HomeDeviceDataModel homeDeviceDataModel;

  const CustomSwitchButton({Key? key, required this.homeDeviceDataModel})
      : super(key: key);

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  late bool isOnOrOff;

  @override
  void initState() {
    isOnOrOff = widget.homeDeviceDataModel.status == 1 ? true : false;
    super.initState();
  }

  String updatedStringRef = '';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () async {
        setState(() {
          isOnOrOff = !isOnOrOff;
        });
        final ref =
            await FirebaseDatabase.instance.ref().child("users/$username/test").get();
        String reference0 = ref.value.toString();
        List str2 = reference0.split("-").toList();
        if (widget.homeDeviceDataModel.status == 1) {
          str2.replaceRange(
              (int.parse(widget.homeDeviceDataModel.statusIndex.toString()) -
                  2),
              (int.parse(widget.homeDeviceDataModel.statusIndex.toString()) -
                  1),
              ["0"].toList());
          List updatedRefList = str2.map((e) => "$e").toList();
          updatedStringRef = updatedRefList.join("-");
        } else {
          str2.replaceRange(
              (int.parse(widget.homeDeviceDataModel.statusIndex.toString()) -
                  2),
              (int.parse(widget.homeDeviceDataModel.statusIndex.toString()) -
                  1),
              ["1"].toList());
          List updatedRefList = str2.map((e) => "$e").toList();
          updatedStringRef = updatedRefList.join("-");
        }
        FirebaseDatabase.instance
            .ref()
            .update({'users/$username/test': updatedStringRef});
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
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
