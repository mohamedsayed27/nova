import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nova/core/cache_manager/cache_helper.dart';
import 'package:nova/core/cache_manager/cache_keys.dart';
import '../app_constants.dart';

class FireStoreMethods{
  static FirebaseFirestore instance = FirebaseFirestore.instance;

  static void uploadTokenToFireStore() async{
    var response = await instance.collection("users").doc(username).get();
    deviceToken = CacheHelper.getData(key: CacheKeys.deviceToken);
    final token = await FirebaseMessaging.instance.getToken();
    List<String> list = [];
    if(response.data() == null){
      await instance.collection("users").doc(username).set({
        "tokens":[token]
      });
      CacheHelper.saveData(key: CacheKeys.deviceToken, value: token);
    }else{
      if(deviceToken!=null){
        if(token != deviceToken){
          for(var element in response.data()!["tokens"]){
            if(element.toString() != deviceToken){
              list.add(element);
            }
          }
          list.add(token!);
          await instance.collection("users").doc(username).update({
            "tokens":list
          });
        }
      }else{
        CacheHelper.saveData(key: CacheKeys.deviceToken, value: token).then((value) async{
          for(var element in response.data()!["tokens"]){
            if(element.toString() != deviceToken){
              list.add(element);
            }
          }
          list.add(token!);
          await instance.collection("users").doc(username).update({
            "tokens":list
          });
        });
      }
    }
    print(deviceToken);
    print(token);
    print(deviceToken==token);
  }

  static Future<void> initFirebaseMessaging() async {
    FirebaseMessaging.onMessage.listen((event){});
    FirebaseMessaging.onMessageOpenedApp.listen((event){});
    FirebaseMessaging.instance.getInitialMessage();
  }

}