import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toastification/toastification.dart';

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
          if (context.mounted) {
            // ScaffoldMessenger.of(context)
            //     .showSnackBar(
            //       SnackBar(
            //         backgroundColor: Colors.green,
            //         content: Text('You are clocked out!'),
            //       ),
            //     )
            //     .closed
            //     .then((value) {
            //       ref.watch(employeeProvider.notifier).clearEmployee();
            //     });
            Confetti.launch(
              context,
              options: ConfettiOptions(particleCount: 100, spread: .9, x: 1.0),
            );
            toastification.show(
              context: context,
              title: Text('You are Clocked Out!'),
              autoCloseDuration: const Duration(seconds: 2),
              type: ToastificationType.success,
              style: ToastificationStyle.flatColored,
              alignment: Alignment.topCenter,
              icon: FaIcon(FontAwesomeIcons.hourglassEnd),
              callbacks: ToastificationCallbacks(
                onAutoCompleteCompleted: (value) {
                  ref.watch(employeeProvider.notifier).clearEmployee();
                },
              ),
            );
          }
          // ref.watch(employeeProvider.notifier).clearEmployee();
          // Navigator.pop(context);
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
