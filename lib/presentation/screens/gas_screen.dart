import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_colors/app_colors.dart';
import '../../core/assets_path/images_path.dart';
import '../widgets/gas_item_builder.dart';
import '../widgets/nova_widget_container.dart';

class GasScreen extends StatelessWidget {
  const GasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            const NovaContainer(),

            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const GasItemBuilder(),
                  SizedBox(
                    height: 40.h,
                  ),
                  const GasItemBuilder(),
                  SizedBox(
                    height: 40.h,
                  ),
                  const GasItemBuilder(),
                  SizedBox(
                    height: 40.h,
                  ),
                  const GasItemBuilder(),
                  SizedBox(
                    height: 40.h,
                  ),
                  const GasItemBuilder(),
                  SizedBox(
                    height: 40.h,
                  ),
                  const GasItemBuilder(),
                  SizedBox(
                    height: 40.h,
                  ),
                  const GasItemBuilder(),
                  SizedBox(
                    height: 40.h,
                  ),
                  const GasItemBuilder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
