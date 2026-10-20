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
  bool isLoading = false;

  void checkEmployee(String id) {
    setState(() {
      isLoading = true;
    });
    ref.read(employeeProvider.notifier).checkEmployee(id);
    print(ref.read(employeeProvider));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 32,
        children: [
          Text(
            'Enter ID Number',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: TextField(
              style: TextStyle(fontSize: 29),
              textAlign: TextAlign.center,
              controller: idController,
              onSubmitted: (value) {},
              autofocus: true,
              decoration: InputDecoration(
                label: Text('ID'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              checkEmployee(idController.text);
            },
            child: isLoading ? CircularProgressIndicator() : Text('Submit'),
          ),
        ],
      ),
    );
  }
}
