
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiver/iterables.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/models/device_model.dart';
import '../../data/models/home_device_data_model.dart';
import '../widgets/build_home_item.dart';
import '../widgets/nova_widget_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DeviceModel> devicesList = [];
  List<HomeDeviceDataModel> homeDeviceDataList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              const NovaContainer(),
              Expanded(
                child: StreamBuilder(
                  stream: Rx.combineLatest2(
                      FirebaseDatabase.instance
                          .ref()
                          .child("users/test")
                          .onValue,
                      FirebaseDatabase.instance
                          .ref("users/doha/devices")
                          .onValue, (a, b) {

                    return [a, b];
                  }),
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasData){
                      final map1 = snapshot.data[1].snapshot.children.toList();
                      devicesList = [];
                      map1.forEach((e){
                        var map = {
                          'name': e.value['name'].toString(),
                          'id': e.value['id'],
                          'deviceNodeName': e.key,
                        };
                        final user = DeviceModel.fromJson(map);
                        devicesList.add(user);
                      });
                      final reference2 = snapshot.data[0].snapshot.value.toString();
                      String reference = reference2.substring(2);
                      List<Map<String, dynamic>> timerList = [];
                      List<Map<String, dynamic>> statusList = [];
                      List<Map<String, dynamic>> devicesIdsIdx = [];
                      Map<String, dynamic> deviceMap = {};
                      List all = [];
                      int statusIndex = 1;
                      int timerIndex = 2;
                      int nameIndex = 3;
                      List str = reference.split("-").toList();

                      for (int i = 1; i <= str.length; i++) {
                        if (i == statusIndex) {
                          statusList.add({
                            "status": int.parse(str[i - 1]),
                            "statusIndex": i + 2
                          });
                          statusIndex = i + 3;
                        }
                        if (i == timerIndex) {
                          timerList.add({
                            "timer": int.parse(str[i - 1]),
                            "timerIndex": i + 2
                          });
                          timerIndex = i + 3;
                        }
                        if (i == nameIndex) {
                          devicesIdsIdx.add({
                            "deviceId": int.parse(str[i - 1]),
                            "deviceIdIndex": i + 2
                          });
                          nameIndex = i + 3;
                        }
                      }
                      for (var pair in zip(
                          [statusList, timerList, devicesIdsIdx])) {
                        all.add(pair);
                      }
                      List<Map<String, dynamic>> mapTest =[];
                      homeDeviceDataList.clear();
                      for (var element in all) {
                        deviceMap = Map<String, dynamic> .from({
                          "status": element[0]['status'],
                          "timer": element[1]['timer'],
                          "name": devicesList.firstWhere((e) => e.id == element[2]["deviceId"]).name,
                          "deviceNodeName": devicesList.firstWhere((e) => e.id == element[2]["deviceId"]).deviceNodeName,
                          "deviceId": element[2]['deviceId'],
                          "statusIndex": element[0]['statusIndex'],
                          "timerIndex": element[1]['timerIndex'],
                          "deviceIdIndex": element[2]['deviceIdIndex'],
                        });
                        mapTest.add(deviceMap);
                        homeDeviceDataList.add(HomeDeviceDataModel.fromJson(deviceMap));
                      }
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: DeviceControllerWidget(
                              homeDeviceDataModel: homeDeviceDataList[index],
                            ),
                          );
                        },
                        itemCount: snapshot.data[1].snapshot.children.length,
                      );
                    }else{
                      return const Center(
                        child:
                        CircularProgressIndicator.adaptive(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
