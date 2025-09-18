
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/order_cubit.dart';
import 'add_order_sheet.dart';

class AddOrderButton extends StatelessWidget {
  const AddOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.add),
        label: const Text('إضافة طلب جديد'),
        onPressed: () {
          final cubit = context.read<OrderCubit>();
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) =>
                BlocProvider.value(value: cubit, child: const AddOrderSheet()),
          );
        },
      ),
    );
  }
}
