import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/assets_path/fonts_path.dart';

class RoomWidgetBuilder extends StatefulWidget {
  const RoomWidgetBuilder({Key? key}) : super(key: key);

  @override
  State<RoomWidgetBuilder> createState() => _RoomWidgetBuilderState();
}

class _RoomWidgetBuilderState extends State<RoomWidgetBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: Text(
              'Room Name',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: FontsPath.tajawalRegular,
                  fontSize: 18.sp),
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Temperature',style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontsPath.tajawalBold,
                    fontSize: 16.sp),),
                Container(
                  height: 50.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      '48%',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontsPath.tajawalRegular,
                          fontSize: 16.sp),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text('Humidity',style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontsPath.tajawalBold,
                    fontSize: 16.sp),),
                Container(
                  height: 50.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      '48%',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontsPath.tajawalRegular,
                          fontSize: 16.sp),
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
