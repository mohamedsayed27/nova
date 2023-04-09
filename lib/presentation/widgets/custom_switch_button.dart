import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitchButton extends StatefulWidget {

  const CustomSwitchButton({Key? key}) : super(key: key);

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isOnOrOff = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        setState(() {
          isOnOrOff = !isOnOrOff;
        });
      },
      child: SizedBox(
        width: 65.w,
        height: 40.h,
        child: Stack(
          children: [
            Container(
              width: 65.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isOnOrOff ? Colors.white : const Color(0xff4cda64),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(
                  18.r,
                ),
              ),
            ),
            AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              alignment: isOnOrOff ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 150),
              child: Card(
                elevation: 5,
                margin: EdgeInsets.zero,
                shape: CircleBorder(
                ),
                child: Container(
                  width: 33.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10.r,

                        )
                      ]
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
