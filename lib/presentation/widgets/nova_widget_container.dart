import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_colors/app_colors.dart';
import '../../core/assets_path/images_path.dart';

class NovaContainer extends StatelessWidget {
  const NovaContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Container(
          height: 70.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(2.w, 3.h),
                  blurRadius: 10.r)
            ],
          ),
          child: Center(
            child: Image.asset(
              ImagesPath.splashLogo,
              width: 100.w,
              height: 90.h,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
