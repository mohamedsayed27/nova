import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/app_colors/app_colors.dart';
import 'package:nova/core/app_router/app_router.dart';
import 'core/app_router/screen_names.dart';
import 'core/cache_manager/cache_helper.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(413, 892),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: AppColors.createMaterialColor(AppColors.primaryColor),
          ),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: ScreenName.splashScreen,
          // home: MainLayout(),
        );
      },
    );
  }
}
