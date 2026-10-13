import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/stage_provider.dart';

class IdStep extends ConsumerStatefulWidget {
  const IdStep({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IdStepState();
}

class _IdStepState extends ConsumerState<IdStep> {
  final idController = TextEditingController();

  void checkEmployee(String id) => {
    ref.watch(employeeProvider.notifier).setEmployee(id),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      children: [
        Icon(Icons.badge_outlined, size: 60),
        Text(
          'Enter ID Number',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: TextField(
            textAlign: TextAlign.center,
            controller: idController,
            onSubmitted: (value) {
              checkEmployee(idController.text);
            },
            autofocus: true,
            decoration: InputDecoration(
              label: Text('ID'),
              border: OutlineInputBorder(),
            ),
          ),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
          ),
          onPressed: () {
            ref.read(stageProvider.notifier).incrementStage();
          },
          child: Text('NEXT'),
        ),
      ],
    );
  }
}
