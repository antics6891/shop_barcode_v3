import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LunchStartBtn extends ConsumerWidget {
  String dbUuid;
  LunchStartBtn({super.key, required this.dbUuid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            padding: EdgeInsets.all(21),
          ),
          onPressed: () async {
            final res = await Supabase.instance.client
                .from('attendance')
                .update({'lunch_start': DateTime.now().toIso8601String()})
                .eq('uuid', dbUuid)
                .select();
            if (res.isNotEmpty) {
              ref.watch(employeeProvider.notifier).clearEmployee();
              Navigator.of(context).pop(true);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.keyboard_double_arrow_left_outlined),
              SizedBox(width: 8),
              Text('START LUNCH', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
