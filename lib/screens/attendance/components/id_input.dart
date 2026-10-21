import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';

class IdInput extends ConsumerStatefulWidget {
  const IdInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IdInputState();
}

class _IdInputState extends ConsumerState<IdInput> {
  final idController = TextEditingController();

  void handleSubmit() async {
    if (idController.text.isNotEmpty) {
      ref.watch(employeeProvider.notifier).checkEmployee(idController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: idController,
      onSubmitted: (value) {
        handleSubmit();
      },
      autofocus: true,
      style: TextStyle(fontSize: 30),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
      ),
    );
  }
}
