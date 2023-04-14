import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/app_constants.dart';
import 'package:nova/core/cache_manager/cache_helper.dart';
import 'package:nova/core/cache_manager/cache_keys.dart';

import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_router/screen_names.dart';
import '../../../core/assets_path/images_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _loading();
    super.initState();
  }

  _loading() {
    username = CacheHelper.getData(key: CacheKeys.username);
    Timer(
      const Duration(seconds: 2),
          () {
        if(username !=null){
          Navigator.pushReplacementNamed(context, ScreenName.mainLayout);
        }else{
          Navigator.pushReplacementNamed(context, ScreenName.login);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(
          ImagesPath.splashLogo,
          height: 100.h,
          width: 200.w,
        ),
      ),
    );
  }
}
