import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/order.dart';
import '../../logic/order_cubit.dart';

class OrdersBlocBuilder extends StatelessWidget {
  const OrdersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is OrderLoaded) {
            if (state.orders.isEmpty) {
              return const Center(child: Text('مفيش طلبات حالياً'));
            }
            final pending = state.orders
                .where((o) => o.status == OrderStatus.pending)
                .toList();
            return ListView.builder(
              itemCount: pending.length,
              itemBuilder: (ctx, i) {
                final o = pending[i];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(
                      '${o.drink.name} x${o.quantity} - ${o.customerName}',
                    ),
                    subtitle: Text(
                      '${o.specialInstructions}\n${o.createdAt.toLocal()}'
                          .split('.')
                          .first,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: () async {
                        await context.read<OrderCubit>().markCompleted(o);
                      },
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
