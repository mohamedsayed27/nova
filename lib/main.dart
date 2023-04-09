import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova/core/app_colors/app_colors.dart';
import 'package:nova/core/app_router/app_router.dart';
import 'business_logic/device_cubit/devices_cubit.dart';
import 'core/app_router/screen_names.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(413, 892),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(providers: [
          BlocProvider(create: (context) => DevicesCubit()..readDevicesFromDataBase(userName: "Doha23", password: "987654321")),
        ], child:  MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: AppColors.createMaterialColor(AppColors.primaryColor),
          ),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: ScreenName.splashScreen,
          // home: MainLayout(),
        ));
      },
    );
  }
}
