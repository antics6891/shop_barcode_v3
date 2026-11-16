import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LunchStartBtn extends ConsumerWidget {
  String dbUuid;
  LunchStartBtn({super.key, required this.dbUuid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
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
          if (context.mounted) {
            toastification.show(
              context: context,
              title: Text('Lunch Started!'),
              autoCloseDuration: const Duration(seconds: 2),
              type: ToastificationType.info,
              style: ToastificationStyle.flatColored,
              alignment: Alignment.topCenter,
              icon: FaIcon(FontAwesomeIcons.hourglassHalf),
              callbacks: ToastificationCallbacks(
                onAutoCompleteCompleted: (value) {
                  ref.watch(employeeProvider.notifier).clearEmployee();
                },
              ),
            );
          }
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
    );
  }
}
