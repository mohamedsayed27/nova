import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../core/assets_path/fonts_path.dart';

class GasItemBuilder extends StatefulWidget {
  const GasItemBuilder({Key? key}) : super(key: key);

  @override
  State<GasItemBuilder> createState() => _GasItemBuilderState();
}

class _GasItemBuilderState extends State<GasItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: Text(
              'Room Name',
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
        Center(
          child: SfLinearGauge(
            // ranges: const [
            //   LinearGaugeRange(
            //
            //     startValue: 0,
            //     endValue: 50,
            //   ),
            // ],
            markerPointers: const [
              LinearShapePointer(
                value: 50,
              ),
            ],
            barPointers: const [
              LinearBarPointer(
                value: 50,
                color: Colors.red,
              ),
            ],
          ),
        )
      ],
    );
  }
}
