import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/di/injector.dart';
import 'features/orders/logic/order_cubit.dart';
import 'features/orders/presentation/orders_page.dart';
import 'core/theming/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('orders_box');
  await Injector.setup();

  runApp(const SmartAhwaApp());
}

class SmartAhwaApp extends StatelessWidget {
  const SmartAhwaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Ahwa Manager',
      theme: AppTheme.light(),
      home: BlocProvider(
        create: (context) => sl<OrderCubit>()..loadOrders(),
        child: const OrdersPage(),
      ),
    );
  }
}
