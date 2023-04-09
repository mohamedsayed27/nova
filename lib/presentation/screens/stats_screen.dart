import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/nova_widget_container.dart';
import '../widgets/stats_widget_builder.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            const NovaContainer(),

            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),

                children: [
                  const RoomWidgetBuilder(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const RoomWidgetBuilder(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const RoomWidgetBuilder(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const RoomWidgetBuilder(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const RoomWidgetBuilder(),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
