import '../../domain/entities/order.dart';
import '../../domain/repos/order_repository.dart';
import '../datasource/order_datasource.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource local;
  OrderRepositoryImpl({required this.local});

  @override
  Future<void> addOrder(Order order) async {
    await local.saveOrder(order.toMap());
  }

  @override
  Future<List<Order>> getAllOrders() async {
    final maps = await local.getAllOrders();
    return maps.map((m) => Order.fromMap(m)).toList();
  }

  @override
  Future<void> updateOrder(Order order) async {
    await local.updateOrder(order.id, order.toMap());
  }

  @override
  Future<String> exportReportText({DateTime? from, DateTime? to}) async {
    final all = await getAllOrders();
    final filtered = all.where((o) {
      if (from != null && o.createdAt.isBefore(from)) return false;
      if (to != null && o.createdAt.isAfter(to)) return false;
      return true;
    }).toList();

    // top selling
    final Map<String, int> counts = {};
    int totalOrders = 0;
    double totalRevenue = 0;
    for (var o in filtered) {
      counts[o.drink.name] = (counts[o.drink.name] ?? 0) + o.quantity;
      totalOrders += o.quantity;
      totalRevenue += o.totalPrice;
    }

    final top = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final buffer = StringBuffer();
    buffer.writeln('تقرير المبيعات');
    buffer.writeln(
      'الفترة: ${from?.toIso8601String() ?? 'الكل'} - ${to?.toIso8601String() ?? 'الكل'}',
    );
    buffer.writeln('--------------------------------------------------');
    buffer.writeln('Top selling drinks:');
    for (var e in top) {
      buffer.writeln(' - ${e.key}: ${e.value} عدد');
    }
    buffer.writeln('--------------------------------------------------');
    buffer.writeln('Total orders served: $totalOrders');
    buffer.writeln('Total revenue (EGP): ${totalRevenue.toStringAsFixed(2)}');
    return buffer.toString();
  }
}
