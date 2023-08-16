import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nova/core/app_colors/app_colors.dart';
import 'package:nova/core/app_router/screen_names.dart';
import 'package:nova/core/assets_path/fonts_path.dart';
import 'package:nova/core/assets_path/images_path.dart';
import 'package:nova/core/assets_path/svg_path.dart';
import 'package:nova/core/cache_manager/cache_helper.dart';
import 'package:nova/core/cache_manager/cache_keys.dart';

import '../../core/app_constants.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/forget_password_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final firebaseInstance = FirebaseDatabase.instance.ref();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login(
      {required String userName,
      required String password,
      required BuildContext context}) async {
    var popNav = Navigator.of(context);
    showProgressIndicator(context);
    dynamic user = await firebaseInstance
        .child("$baseFirebaseDatabaseNode$userName")
        .get();
    print(user.value);
    if (user.value != null) {
      dynamic pass = await firebaseInstance
          .child("$baseFirebaseDatabaseNode$userName/pass")
          .get();

      if (password == pass.value) {
        popNav.pop();
        CacheHelper.saveData(key: CacheKeys.username, value: user.key)
            .whenComplete(() {
          username = CacheHelper.getData(key: CacheKeys.username);
          Navigator.pushNamedAndRemoveUntil(context, ScreenName.mainLayout, (route) => false);
        });
        Fluttertoast.showToast(
          msg: 'Login success',
          backgroundColor: Colors.green,
        );
      } else {
        popNav.pop();
        Fluttertoast.showToast(
          msg: 'Wrong password',
          backgroundColor: Colors.red,
        );
      }
    } else {
      popNav.pop();
      Fluttertoast.showToast(
        msg: 'Wrong username',
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 110.w),
              child: Container(
                height: 140.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(2.w, 3.h),
                        blurRadius: 6.r)
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    ImagesPath.splashLogo,
                    color: Colors.black,
                    width: 100.w,
                    height: 80.h,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            AuthTextField(controller: nameController, title: "Username", isPassword: false),
            SizedBox(
              height: 35.h,
            ),
            AuthTextField(controller: passwordController, title: "Password", isPassword: true),
            SizedBox(
              height: 10.h,
            ),
            const ForgetPasswordWidget(),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 60.w),
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    print(nameController.text);
                    _login(
                      userName: nameController.text,
                      password: passwordController.text,
                      context: context,
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: 'يجب ادخال جميع البيانات',
                        backgroundColor: Colors.red);
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r)),
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 14.h)),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
