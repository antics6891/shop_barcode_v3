import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClockOutBtn extends ConsumerWidget {
  String dbUuid;
  ClockOutBtn({super.key, required this.dbUuid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(21),
        backgroundColor: Colors.green.shade600,
      ),
      onPressed: () async {
        final res = await Supabase.instance.client
            .from('attendance')
            .update({'clock_out': DateTime.now().toIso8601String()})
            .eq('uuid', dbUuid)
            .select();
        if (res.isNotEmpty) {
          ref.watch(employeeProvider.notifier).clearEmployee();
          Navigator.pop(context);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back_sharp),
          SizedBox(width: 8),
          Text('CLOCK OUT', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
