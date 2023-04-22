import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiver/iterables.dart';
import '../../core/app_constants.dart';
import '../../data/models/new_device_model.dart';
import '../widgets/build_home_item.dart';
import '../widgets/nova_widget_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<NewDeviceModel> newDeviceList =[];

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
                  stream: FirebaseDatabase.instance
                      .ref()
                      .child("users/$username").child('newTest')
                      .onValue,
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {

                    if(snapshot.hasData){
                      final reference2 = snapshot.data.snapshot.value.toString();
                      List<Map<String, dynamic>> statusList = [];
                      List<Map<String, dynamic>> devicesList = [];
                      List all = [];
                      Map<String, dynamic> deviceMap = {};
                      String reference = reference2.substring(2);
                      List str = reference.split("-").toList();
                      for (int i = 0; i < str.length; i++) {
                        if (i % 2 == 0) {
                          statusList.add({
                            'deviceStatusIndex': i,
                            'deviceStatus': str[i],
                          });
                        } if (i % 2 != 0) {
                          devicesList.add({
                            'deviceNameIndex': i,
                            'deviceName': str[i],
                          });
                        }
                      }
                      for (var pair in zip([
                        statusList,
                        devicesList,
                      ])) {
                        all.add(pair);
                      }
                      newDeviceList = [];
                      for (var element in all) {
                        deviceMap = Map<String, dynamic> .from({
                          'deviceStatusIdx':element[0]['deviceStatusIndex'].toString(),
                          'deviceStatus':element[0]['deviceStatus'].toString(),
                          'deviceNameIdx':element[1]['deviceNameIndex'].toString(),
                          'deviceName':element[1]['deviceName'].toString(),
                        });
                        if(!newDeviceList.contains(NewDeviceModel.fromJson(deviceMap))){
                          newDeviceList.add(NewDeviceModel.fromJson(deviceMap));
                        }
                      }

                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: DeviceControllerWidget(
                              newDeviceModel: newDeviceList[index],
                            ),
                          );
                        },
                        itemCount: devicesList.length,
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
