import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toastification/toastification.dart';

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
      // final res = await Supabase.instance.client
      //     .from('employees')
      //     .select()
      //     .eq('emp_id', idController.text);
      // if (res.isNotEmpty) {
      // } else {
      //   toastification.show(
      //     title: Text('Hello'),
      //     style: ToastificationStyle.minimal,
      //     autoCloseDuration: Duration(seconds: 2),
      //     alignment: Alignment.topCenter,
      //     primaryColor: Colors.red,
      //     borderRadius: BorderRadius.circular(9),
      //     callbacks: ToastificationCallbacks(
      //       onAutoCompleteCompleted: (value) {
      //         idController.clear();
      //       },
      //     ),
      //   );
      // }
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
