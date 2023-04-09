import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/app_colors/app_colors.dart';
import 'package:nova/core/assets_path/fonts_path.dart';
import 'package:nova/core/assets_path/images_path.dart';

import '../../core/app_router/screen_names.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 100.w),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Container(
                height: 90.h,
                width: 130.w,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(2.w, 3.h),
                          blurRadius: 6.r)
                    ]),
                child: Center(
                  child: Image.asset(
                    ImagesPath.splashLogo,
                    width: 100.w,
                    height: 90.h,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'User Name',
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
            SizedBox(
              height: 35.h,
            ),
            TextField(
              cursorHeight: 25.h,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: FontsPath.tajawalRegular,
                    fontSize: 18.sp),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: const BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: const BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, ScreenName.mainLayout);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r)),
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 12.h)),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontsPath.tajawalBold,
                    fontSize: 20.sp,
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
