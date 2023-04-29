import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/app_colors/app_colors.dart';

import '../../core/assets_path/fonts_path.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String  title;
  final bool isPassword;
  const AuthTextField({Key? key, required this.controller, required this.title, required this.isPassword}) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {

  final InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      5.r,
    ),
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
  );

  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 25.h,
      controller: widget.controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 24.sp
        ),
        label: Text(widget.title),
        hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: FontsPath.tajawalRegular,
            fontSize: 18.sp),
        suffixIcon: widget.isPassword?IconButton(onPressed: (){
          setState(() {
            isObscure=!isObscure;
          });
        }, icon: isObscure?const Icon(Icons.visibility_off):const Icon(Icons.visibility)):null,
        enabledBorder: border,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5.r,
          ),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        border: border,
      ),
    );
  }
}
