import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: IdInput(),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [ClockInBtn()],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [LunchStartBtn()],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [LunchEndBtn()],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [ClockOutBtn()],
            // ),
          ],
        ),
      ),
    );
  }
}
