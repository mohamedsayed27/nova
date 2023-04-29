import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../core/assets_path/fonts_path.dart';
import 'add_device_name_dialog.dart';

class GasItemBuilder extends StatefulWidget {
  final String? roomName;
  final String? gasLimit;
  final String? nodeName;
  const GasItemBuilder({Key? key, required this.gasLimit, required this.roomName,required this.nodeName}) : super(key: key);

  @override
  State<GasItemBuilder> createState() => _GasItemBuilderState();
}

class _GasItemBuilderState extends State<GasItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            showDialog(context: context, builder: (context)=>AddDeviceNameAlertDialog(name: widget.roomName, nodeName: widget.nodeName, changeNameType: "gasRooms",));
          },
          child: Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                widget.roomName??'Room Name',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: FontsPath.tajawalRegular,
                    fontSize: 18.sp),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Center(
          child: SfLinearGauge(

            markerPointers: [
              LinearShapePointer(
                value: double.parse(widget.gasLimit!),
              ),
            ],
            barPointers:  [
              LinearBarPointer(
                value: double.parse(widget.gasLimit!),
                color: double.parse(widget.gasLimit!)>=0&&double.parse(widget.gasLimit!)<35?Colors.green:double.parse(widget.gasLimit!)>=35&&double.parse(widget.gasLimit!)<75?Colors.amber:Colors.red,
              ),
            ],
          ),
        )
      ],
    );
  }
}
