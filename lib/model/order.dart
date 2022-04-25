import 'dart:convert';

import 'package:abctechapp/model/order_location.dart';

class Order {
  int operatorId;
  List<int> tasks = [];
  OrderLocation? start;
  OrderLocation? end;

  Order(
      {required this.operatorId,
      required this.tasks,
      required this.start,
      required this.end});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'operatorId': operatorId,
      'tasks': tasks,
      'startOrderLocation': start?.toMap(),
      'endOrderLocation': end?.toMap()
    };
  }

  String toJson() => json.encode(toMap());
}
