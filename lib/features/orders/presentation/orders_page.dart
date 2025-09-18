import 'package:flutter/material.dart';
import 'widgets/add_order_button.dart';
import 'widgets/orders_bloc_builder.dart';
import 'widgets/selling_report_widget.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Ahwa - إدارة الطلبات'),
        actions: [
          Builder(
            builder: (context) {
              return SellingReportWidget();
            },
          ),
        ],
      ),
      body: Column(children: [OrdersBlocBuilder(), AddOrderButton()]),
    );
  }
}
