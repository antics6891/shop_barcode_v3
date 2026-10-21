import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/clock_in_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/clock_out_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/id_input.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/lunch_end_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/lunch_start_btn.dart';

class Attendance extends ConsumerStatefulWidget {
  const Attendance({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AttendanceState();
}

class _AttendanceState extends ConsumerState<Attendance> {
  final isError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ATTENDANCE KIOSK',
                  style: TextStyle(fontSize: 28, letterSpacing: 1.15),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ref.watch(timecardProvider) == null
                    ? ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 300),
                        child: IdInput(),
                      )
                    : Text(ref.watch(employeeProvider)!.firstName.toString()),
              ],
            ),
            ref.watch(timecardProvider)!.clock_in == null
                ? ClockInBtn()
                : Text(
                    'CLOCK IN: ${ref.read(timecardProvider)!.clock_in!.toLocal()}',
                  ),

            // ref.watch(timecardProvider)!.clock_in != null &&
            //         ref.watch(timecardProvider)!.lunch_start == null
            //     ? LunchStartBtn()
            //     : ref.watch(timecardProvider)!.lunch_start != null
            //     ? Text(
            //         'Lunch Start: ${ref.watch(timecardProvider)!.lunch_start.toString()}',
            //       )
            //     : Container(),
            // ref.watch(timecardProvider)!.clock_in != null &&
            //         ref.watch(timecardProvider)!.lunch_end != null
            //     ? LunchStartBtn()
            //     : ref.watch(timecardProvider)!.lunch_end != null
            //     ? Text(
            //         'Lunch End: ${ref.watch(timecardProvider)!.lunch_end.toString()}',
            //       )
            //     : Container(),
            // ref.watch(timecardProvider)!.clock_in != null &&
            //         ref.watch(timecardProvider)!.clock_out == null
            //     ? ClockOutBtn()
            //     : Container(),
          ],
        ),
      ),
    );
  }
}
