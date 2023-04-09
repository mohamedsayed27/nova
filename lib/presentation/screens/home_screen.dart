import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/device_cubit/devices_cubit.dart';
import '../../business_logic/device_cubit/devices_state.dart';
import '../../core/app_colors/app_colors.dart';
import '../../core/assets_path/images_path.dart';
import '../widgets/build_home_item.dart';
import '../widgets/nova_widget_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int n = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: BlocConsumer<DevicesCubit, DevicesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                children: [
                  const NovaContainer(),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DeviceControllerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
