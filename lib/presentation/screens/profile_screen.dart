import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nova/core/app_constants.dart';
import 'package:nova/core/assets_path/svg_path.dart';
import 'package:nova/core/cache_manager/cache_helper.dart';
import 'package:nova/core/cache_manager/cache_keys.dart';
import 'package:nova/presentation/screens/web_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/app_colors/app_colors.dart';
import '../../core/app_router/screen_names.dart';
import '../../core/assets_path/fonts_path.dart';
import '../widgets/nova_widget_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final phoneNumber = 'https://wa.me/201016086770';
  final  facebook = 'https://www.facebook.com/Nova278';
  //
  // void _goWhatsapp() async {
  //   try {
  //     await launchUrl(phoneNumber);
  //   } catch (error) {
  //     print(error);
  //   }
  // }
  //
  // void _goFacebook() async {
  //   try {
  //     await launchUrl(facebook);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              SizedBox(
                height: 10.h,
              ),
              Text(
                'System Name : Nova 1',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: FontsPath.tajawalRegular,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
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
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(url: phoneNumber,)));
                    },
                    child: SvgPicture.asset(
                      SvgPath.whatsappIcon,
                      width: 40.w,
                      height: 40.h,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(url: facebook,)));
                      // _goFacebook();
                    },
                    child: SvgPicture.asset(
                      SvgPath.facebookIcon,
                      width: 35.w,
                      height: 35.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                onPressed: () {
                  CacheHelper.removeData(key: CacheKeys.username).whenComplete(() {
                    Navigator.pushNamedAndRemoveUntil(context, ScreenName.login, (route) => false);
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r)),
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 12.h)),
                child: Center(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: FontsPath.tajawalBold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
