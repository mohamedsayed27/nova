import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_constants.dart';
import '../widgets/gas_item_builder.dart';
import '../widgets/nova_widget_container.dart';

class GasScreen extends StatelessWidget {
  const GasScreen({Key? key}) : super(key: key);

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
                    .child("$baseFirebaseDatabaseNode$username/gasRooms")
                    .onValue,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 25.h),
                              child: GasItemBuilder(
                                gasLimit: snapshot.data.snapshot.children
                                    .toList()[index]
                                    .value['gas']
                                    .toString(),
                                roomName: snapshot.data.snapshot.children
                                    .toList()[index]
                                    .value['name']
                                    .toString(),
                                nodeName: snapshot.data.snapshot.children
                                    .toList()[index]
                                    .key,
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
