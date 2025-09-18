abstract class OrderDataSource {
  Future<void> saveOrder(Map<String, dynamic> map);

  Future<List<Map<String, dynamic>>> getAllOrders();

  Future<void> updateOrder(String id, Map<String, dynamic> map);

  Future<void> deleteOrder(String id);
}
