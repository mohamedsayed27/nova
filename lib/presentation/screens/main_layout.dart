import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nova/presentation/screens/gas_screen.dart';
import 'package:nova/presentation/screens/profile_screen.dart';
import 'package:nova/presentation/screens/stats_screen.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../core/assets_path/fonts_path.dart';
import 'home_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int cIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const StatsScreen(),
    const GasScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[cIndex],
        bottomNavigationBar: Container(
          height: 85.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.r),
              topRight: Radius.circular(35.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 0),
                blurRadius: 10.r,
              )
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedFontSize: 14.sp,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 14.sp,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            currentIndex: cIndex,
            selectedLabelStyle: const TextStyle(
                color: AppColors.primaryColor,
                fontFamily: FontsPath.tajawalMedium),
            unselectedLabelStyle: const TextStyle(
                color: AppColors.primaryColor,
                fontFamily: FontsPath.tajawalMedium),
            onTap: (index) {
              setState(() {
                cIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(
                    bottom: 8.0.h,
                  ),
                  child: SvgPicture.asset(
                    SvgPath.home,
                    color: cIndex == 0 ? AppColors.primaryColor : Colors.grey,
                    width: 30.w,
                    height: 35.h,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(
                    bottom: 8.0.h,
                  ),
                  child: SvgPicture.asset(
                    SvgPath.stats,
                    color: cIndex == 1 ? AppColors.primaryColor : Colors.grey,
                    width: 30.w,
                    height: 35.h,
                  ),
                ),
                label: 'Stats',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(
                    bottom: 8.0.h,
                  ),
                  child: SvgPicture.asset(
                    SvgPath.gas,
                    color: cIndex == 2 ? AppColors.primaryColor : Colors.grey,
                    width: 30.w,
                    height: 35.h,
                  ),
                ),
                label: 'Gas',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(
                    bottom: 8.0.h,
                  ),
                  child: SvgPicture.asset(
                    SvgPath.me,
                    color: cIndex == 3 ? AppColors.primaryColor : Colors.grey,
                    width: 30.w,
                    height: 35.h,
                  ),
                ),
                label: 'Me',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
