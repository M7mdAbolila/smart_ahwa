import 'drink.dart';

enum OrderStatus { pending, inProgress, completed, cancelled }

class Order {
  final String id;
  final String customerName;
  final Drink drink;
  final String specialInstructions;
  final DateTime createdAt;
  OrderStatus status;
  final int quantity;

  Order({
    required this.id,
    required this.customerName,
    required this.drink,
    this.specialInstructions = '',
    DateTime? createdAt,
    this.status = OrderStatus.pending,
    this.quantity = 1,
  }) : createdAt = createdAt ?? DateTime.now();

  double get totalPrice => drink.getPrice() * quantity;

  Map<String, dynamic> toMap() => {
        'id': id,
        'customerName': customerName,
        'drinkName': drink.name,
        'specialInstructions': specialInstructions,
        'createdAt': createdAt.toIso8601String(),
        'status': status.toString(),
        'quantity': quantity,
        'price': totalPrice,
      };

  static Order fromMap(Map<String, dynamic> map) {
    final drinkName = map['drinkName'] as String? ?? 'شاي';
    final Drink drink = drinkName.contains('تركي')
        ? TurkishCoffee(name: drinkName)
        : Tea(name: drinkName);

    return Order(
      id: map['id'] as String,
      customerName: map['customerName'] as String,
      drink: drink,
      specialInstructions: map['specialInstructions'] as String? ?? '',
      createdAt: DateTime.parse(map['createdAt'] as String),
      status: OrderStatus.values.firstWhere((e) => e.toString() == map['status'],
          orElse: () => OrderStatus.pending),
      quantity: map['quantity'] as int? ?? 1,
    );
  }
}
