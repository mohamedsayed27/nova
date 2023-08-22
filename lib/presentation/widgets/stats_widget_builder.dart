import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/assets_path/fonts_path.dart';
import '../../data/models/rooms_model.dart';
import 'add_device_name_dialog.dart';

class RoomWidgetBuilder extends StatelessWidget {
  final RoomModel? roomModel;
  final String nodeName;

  const RoomWidgetBuilder(
      {Key? key, required this.roomModel, required this.nodeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AddDeviceNameAlertDialog(
                      name: roomModel!.roomName,
                      nodeName: nodeName,
                      changeNameType: "rooms",
                    ));
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
                roomModel!.roomName ?? 'Room Name',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Temperature',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: FontsPath.tajawalBold,
                      fontSize: 16.sp),
                ),
                Container(
                  height: 50.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${roomModel!.temp}',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: FontsPath.tajawalRegular,
                              fontSize: 16.sp),
                        ),
                        SizedBox(width: 5.w,),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'C',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: FontsPath.tajawalRegular,
                                fontSize: 14.sp,
                              ),
                            ),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -4),
                                child: Text(
                                  'o',
                                  //superscript is usually smaller in size
                                  textScaleFactor: 0.8,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: FontsPath.tajawalRegular,
                                      fontSize: 14.sp),
                                ),
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'Humidity',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontsPath.tajawalBold,
                    fontSize: 16.sp,
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      '${roomModel!.hum} %',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: FontsPath.tajawalRegular,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
