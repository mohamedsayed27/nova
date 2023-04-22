import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/app_constants.dart';

import '../../core/assets_path/fonts_path.dart';
import '../widgets/nova_widget_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NovaContainer(),
            Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  '$username',
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: FontsPath.tajawalRegular,
                      fontSize: 18.sp),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              'System Name : Nova 1',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: FontsPath.tajawalRegular,
                  fontSize: 14.sp),
            ),
            SizedBox(height: 5.h,),
            Text(
              'System Details : D S P 821',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: FontsPath.tajawalRegular,
                  fontSize: 14.sp),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  'About Nova : ',
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: FontsPath.tajawalRegular,
                      fontSize: 14.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
