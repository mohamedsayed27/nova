import 'package:equatable/equatable.dart';

class DeviceModel extends Equatable{
  final String? name;
  final String? deviceNodeName;
  final int? id;

  const DeviceModel({this.name, this.id, this.deviceNodeName});

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
        name : json['name'],
        id : json['id'],
      deviceNodeName: json['deviceNodeName'],
    );
  }

  @override
  List<Object?> get props => [
    name,
    id,
    deviceNodeName,
  ];

}
