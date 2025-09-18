import 'package:hive/hive.dart';

import 'order_datasource.dart';

class LocalOrderDataSource implements OrderDataSource {
  final Box box = Hive.box('orders_box');

  @override
  Future<void> saveOrder(Map<String, dynamic> map) async {
    await box.put(map['id'], map);
  }

  @override
  Future<List<Map<String, dynamic>>> getAllOrders() async {
    return box.values
        .cast<Map>()
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  @override
  Future<void> updateOrder(String id, Map<String, dynamic> map) async {
    await box.put(id, map);
  }

  @override
  Future<void> deleteOrder(String id) async {
    await box.delete(id);
  }
}
