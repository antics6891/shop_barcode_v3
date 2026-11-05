import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClockInBtn extends ConsumerWidget {
  const ClockInBtn({super.key});

  void handleClockIn(int id, BuildContext context) async {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(21)),
      onPressed: () async {
        final what = await Supabase.instance.client.from('attendance').insert({
          'clock_in': DateTime.now().toIso8601String(),
          'emp_uuid': ref.watch(employeeProvider)!.uuid,
        }).select();
        if (what.isNotEmpty) {
          ref.watch(employeeProvider.notifier).clearEmployee();
          Navigator.of(context).pop();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.start),
          SizedBox(width: 8),
          Text('CLOCK IN', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
