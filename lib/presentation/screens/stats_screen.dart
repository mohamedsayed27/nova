import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/rooms_model.dart';
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
              child: StreamBuilder(
                stream: FirebaseDatabase.instance
                    .ref()
                    .child("users/doha/rooms")
                    .onValue,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 25.h),
                              child: RoomWidgetBuilder(
                                roomModel: RoomModel.fromJson({
                                  'name': snapshot.data.snapshot.children
                                      .toList()[index]
                                      .value['name']
                                      .toString(),
                                  'hume': snapshot.data.snapshot.children
                                      .toList()[index]
                                      .value['hume']
                                      .toString(),
                                  'temp': snapshot.data.snapshot.children
                                      .toList()[index]
                                      .value['temp']
                                      .toString(),
                                }),
                              ),
                            );
                          },
                          itemCount: snapshot.data.snapshot.children.length,
                        )
                      : const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
