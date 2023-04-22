import 'package:equatable/equatable.dart';

class NewDeviceModel extends Equatable {
  final String? deviceName;
  final String? deviceStatus;
  final String? deviceNameIdx;
  final String? deviceStatusIdx;

  const NewDeviceModel({
    required this.deviceName,
    required this.deviceStatus,
    required this.deviceNameIdx,
    required this.deviceStatusIdx,
  });

  factory NewDeviceModel.fromJson(Map<String, dynamic> json) {
    return NewDeviceModel(
      deviceName: json['deviceName'],
      deviceStatus: json['deviceStatus'],
      deviceNameIdx: json['deviceNameIdx'],
      deviceStatusIdx: json['deviceStatusIdx'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        deviceName,
        deviceStatus,
        deviceNameIdx,
        deviceStatusIdx,
      ];
}
