import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/order_cubit.dart';

class SellingReportWidget extends StatelessWidget {
  const SellingReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.article_outlined),
      onPressed: () async {
        final text = await context.read<OrderCubit>().exportReportText();
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('تقرير مبيعات'),
            content: SingleChildScrollView(child: Text(text)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('إغلاق'),
              ),
            ],
          ),
        );
      },
    );
  }
}
