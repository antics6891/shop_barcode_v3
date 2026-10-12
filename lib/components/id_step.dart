import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';

class IdStep extends ConsumerStatefulWidget {
  const IdStep({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IdStepState();
}

class _IdStepState extends ConsumerState<IdStep> {
  final idController = TextEditingController();
  void checkEmployee(String id) => {
    if (id == '137') {ref.read(employeeProvider.notifier).setEmp(id)},
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.badge_outlined, size: 60),
        Text('Enter ID Number'),
        TextField(
          controller: idController,
          onSubmitted: (value) {
            checkEmployee(idController.text);
          },
          autofocus: true,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
