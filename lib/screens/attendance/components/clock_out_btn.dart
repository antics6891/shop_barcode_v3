import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClockOutBtn extends ConsumerWidget {
  const ClockOutBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(21),
            backgroundColor: Colors.green.shade600,
          ),
          onPressed: () async {
            final res = await Supabase.instance.client
                .from('attendance')
                .update({'clock_out': DateTime.now().toIso8601String()})
                .eq('id', ref.watch(timecardProvider)!.id)
                .select();
            if (res.isNotEmpty) {
              ref.watch(timecardProvider.notifier).clearTimecard();
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
        ),
      ),
    );
  }
}
