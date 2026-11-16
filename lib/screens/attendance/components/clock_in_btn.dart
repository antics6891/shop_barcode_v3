import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/api/timecard_service.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';

class ClockInBtn extends ConsumerWidget {
  const ClockInBtn({super.key});

  void handleClockIn(int id, BuildContext context) async {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(21)),
      onPressed: () async {
        final what = TimecardService().createEmployeeTimecard(
          ref.watch(employeeProvider)!.uuid,
        );
        what.then(
          (value) => {
            if (value.isNotEmpty)
              {
                // ref.watch(employeeProvider.notifier).clearEmployee(),
                if (context.mounted)
                  {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('You are clocked in!!'),
                          ),
                        )
                        .closed
                        .then((value) {
                          ref.watch(employeeProvider.notifier).clearEmployee();
                        }),
                  },
                // Navigator.of(context).pop(),
              },
          },
        );
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
