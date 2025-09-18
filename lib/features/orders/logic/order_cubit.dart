import 'package:bloc/bloc.dart';
import '../domain/entities/drink.dart';
import '../domain/entities/order.dart';
import '../domain/repos/order_repository.dart';
import 'package:uuid/uuid.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository repository;
  OrderCubit({required this.repository}) : super(OrderInitial());

  Future<void> loadOrders() async {
    emit(OrderLoading());
    final orders = await repository.getAllOrders();
    emit(OrderLoaded(orders: orders));
  }

  Future<void> addOrder({
    required String customerName,
    required String drinkName,
    required String specialInstructions,
    int quantity = 1,
  }) async {
    final id = const Uuid().v4();
    // simple mapping: choose Tea or TurkishCoffee
    final drink = drinkName.contains('تركي')
        ? TurkishCoffee(name: drinkName)
        : Tea(name: drinkName, withMint: drinkName.contains('نعناع'));
    final order = Order(
      id: id,
      customerName: customerName,
      drink: drink,
      specialInstructions: specialInstructions,
      quantity: quantity,
    );
    await repository.addOrder(order);
    await loadOrders();
  }

  Future<void> markCompleted(Order order) async {
    order.status = OrderStatus.completed;
    await repository.updateOrder(order);
    await loadOrders();
  }

  Future<String> exportReportText({DateTime? from, DateTime? to}) =>
      repository.exportReportText(from: from, to: to);
}
