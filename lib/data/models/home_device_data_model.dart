import 'package:equatable/equatable.dart';

class HomeDeviceDataModel extends Equatable{
  final String? deviceName;
  final int? status;
  final int? timer;
  final int? statusIndex;
  final int? deviceId;
  final int? timerIndex;
  final int? deviceIdIndex;
  final String? deviceNodeName;

  const HomeDeviceDataModel({this.status,this.deviceName, this.timer,this.deviceNodeName, this.statusIndex, this.deviceId, this.timerIndex, this.deviceIdIndex,});

  factory HomeDeviceDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDeviceDataModel(
      deviceName : json['name'],
      status : json['status'],
      deviceId: json['deviceId'],
      deviceIdIndex: json['deviceIdIndex'],
      statusIndex: json['statusIndex'],
      timer:  json['timer'],
      timerIndex: json['timerIndex'],
      deviceNodeName: json['deviceNodeName'],
    );
  }

  @override
  List<Object?> get props => [
    deviceName,
    status,
    deviceNodeName,
    timer,
    timerIndex,
    deviceId,
    statusIndex,
    deviceIdIndex,
  ];

}
