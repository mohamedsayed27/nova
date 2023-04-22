import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova/data/models/new_device_model.dart';
import 'package:quiver/iterables.dart';
import 'devices_state.dart';

class DevicesCubit extends Cubit<DevicesState> {
  DevicesCubit() : super(DevicesInitial());

  static DevicesCubit get(context) => BlocProvider.of<DevicesCubit>(context);

  String testString = "0-0-fan-1-device1-0-remote-0-tele-1-mobile";
  String updatedStringRef = '';

  List<Map<String, dynamic>> statusList = [];
  List<Map<String, dynamic>> devicesList = [];
  List all = [];
  Map<String, dynamic> deviceMap = {};
  List<NewDeviceModel> newDeviceList =[];
  void testDevicesMethod() {
    String reference = testString.substring(2);
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
    // print(str);
    // print(statusList);
    // print(devicesList);
  }

  void updateName({
  required int idx,
  required String name,
}){
    String reference = testString.substring(2);
    List str = reference.split("-").toList();
    str.replaceRange(idx, idx+1, [name].toList());
    List updatedRefList = str.map((e) => "$e").toList();
    updatedStringRef = updatedRefList.join("-");
  }
}
