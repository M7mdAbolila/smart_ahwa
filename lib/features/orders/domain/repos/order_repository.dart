import '../entities/order.dart';

abstract class OrderRepository {
  Future<void> addOrder(Order order);
  Future<List<Order>> getAllOrders();
  Future<void> updateOrder(Order order);
  Future<String> exportReportText({DateTime? from, DateTime? to});
}
