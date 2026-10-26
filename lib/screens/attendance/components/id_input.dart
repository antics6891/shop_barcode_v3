import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';

class IdInput extends ConsumerStatefulWidget {
  const IdInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IdInputState();
}

class _IdInputState extends ConsumerState<IdInput> {
  final controller = TextEditingController();

  // void handleSubmit() async {
  //   if (controller.text.isNotEmpty) {
  //     ref.watch(employeeProvider.notifier).checkEmployee(idController.text);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ref.listen(employeeProvider, (previous, next) => controller.clear());
    return TextField(
      decoration: InputDecoration(label: Text("ID Number")),
      controller: controller,
      autofocus: true,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30),
    );
  }
}
