import 'package:equatable/equatable.dart';

class RoomModel extends Equatable{
  final String? roomName;
  final String? temp;
  final String? hum;

  const RoomModel({this.roomName, this.hum, this.temp});

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      temp : json['temp'],
      roomName : json['name'],
      hum : json['hume'],
    );
  }

  @override
  List<Object?> get props => [
    roomName,
    temp,
    hum,
  ];

}
