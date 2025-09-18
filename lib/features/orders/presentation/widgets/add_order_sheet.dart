import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/order_cubit.dart';

class AddOrderSheet extends StatefulWidget {
  const AddOrderSheet({super.key});
  @override
  State<AddOrderSheet> createState() => _AddOrderSheetState();
}

class _AddOrderSheetState extends State<AddOrderSheet> {
  final _formKey = GlobalKey<FormState>();
  final _customer = TextEditingController();
  final _drink = TextEditingController();
  final _instructions = TextEditingController();
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'اضافة طلب جديد',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _customer,
                decoration: const InputDecoration(labelText: 'اسم العميل'),
              ),
              TextFormField(
                controller: _drink,
                decoration: const InputDecoration(
                  labelText: 'نوع المشروب (مثال: شاي نعناع، قهوة تركي قوي)',
                ),
              ),
              TextFormField(
                controller: _instructions,
                decoration: const InputDecoration(labelText: 'تعليمات خاصة'),
              ),
              Row(
                children: [
                  const Text('الكمية:'),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (_qty > 1) _qty--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text('$_qty'),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _qty++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              ElevatedButton(
                child: const Text('حفظ'),
                onPressed: () async {
                  if (_customer.text.trim().isEmpty ||
                      _drink.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('اكتب اسم العميل ونوع المشروب'),
                      ),
                    );
                    return;
                  }
                  await context.read<OrderCubit>().addOrder(
                    customerName: _customer.text.trim(),
                    drinkName: _drink.text.trim(),
                    specialInstructions: _instructions.text.trim(),
                    quantity: _qty,
                  );
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
