import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/iterables.dart';

import 'devices_state.dart';

class DevicesCubit extends Cubit<DevicesState> {
  DevicesCubit() : super(DevicesInitial());

  static DevicesCubit get(context) => BlocProvider.of(context);
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  void readDevicesFromDataBase({
    required String userName,
    required String password,
  }) async {
    DataSnapshot ref = await firebaseDatabase.ref().child("$userName/led1").get();
    print(ref.value);
    String reference0 = "0-1-55-1-0-50-2-1-45-3-0-40-4";
    List<Map<String, dynamic>> names = [
      {
        "name": " mohamed",
        "id": 1,
      },
      {
        "name": " ahmed",
        "id": 2,
      },
      {
        "name": " mostafa",
        "id": 3,
      },
      {
        "name": " sayed",
        "id": 4,
      },
    ];
    String reference = reference0.substring(2);
    List<Map<String, dynamic>> timerList = [];
    List<Map<String, dynamic>> statusList = [];
    List<Map<String, dynamic>> namesList = [];
    List<Map<String, dynamic>> mapTest = [];
    List all = [];
    int statusIndex = 1;
    int timerIndex = 2;
    int nameIndex = 3;

    List str = reference.split("-").toList();
    for (int i = 1; i <= str.length; i++) {
      if (i == statusIndex) {
        statusList.add({"status": int.parse(str[i - 1]), "statusIndex": i + 2});
        statusIndex = i + 3;
      }
      if (i == timerIndex) {
        timerList.add({"timer": int.parse(str[i - 1]), "timerIndex": i + 2});
        // timerList.add(int.parse(str[i-1]));
        timerIndex = i + 3;
      }
      if (i == nameIndex) {
        namesList.add({"name": int.parse(str[i - 1]), "nameIndex": i + 2});
        nameIndex = i + 3;
      }
    }
    for (var pair in zip([statusList, timerList, namesList])) {
      all.add(pair);
    }
    for (var element in all) {
      mapTest.add({
        "status": element[0]['status'],
        "timer": element[1]['timer'],
        "name": names.firstWhere((e) => e['id'] == element[2]["name"])["name"],
        "statusIndex": element[0]['statusIndex'],
        "timerIndex": element[1]['timerIndex'],
        "nameIndex": element[2]['nameIndex'],
      });
    }
    print(mapTest);
    print("\n\n\n\n");
    print(reference0);
    print("\n\n\n\n");
    reference0 = reference0.replaceRange((int.parse(mapTest[0]["nameIndex"].toString()) - 1), ((int.parse(mapTest[0]["name"].toString()) + int.parse(mapTest[0]["nameIndex"].toString())) - 1), "5");
    print(reference0);
  }
}
