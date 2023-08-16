import 'package:flutter/material.dart';
import 'package:nova/core/cache_manager/cache_helper.dart';

import 'cache_manager/cache_keys.dart';

String? username = CacheHelper.getData(key: CacheKeys.username);
String? deviceToken = CacheHelper.getData(key: CacheKeys.deviceToken);
const baseFirebaseDatabaseNode = 'users/';
void showProgressIndicator(BuildContext context){
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator.adaptive(),
    ),
  );
  showDialog(context: context, builder: (context)=>WillPopScope(child: alertDialog, onWillPop: ()async{return true;}),barrierDismissible: false);
}
