import 'package:flutter/material.dart';
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
  Widget _buidStatusText() {
    if (ref.watch(timecardProvider) == null ||
        ref.watch(timecardProvider)!.clock_in == null) {
      return Text('Status: Not Clocked In');
    }
    if (ref.watch(timecardProvider)!.clock_out != null) {
      return Text('Status: Shift Completed for Today');
    }
    if (ref.watch(timecardProvider)!.lunch_start != null &&
        ref.watch(timecardProvider)!.lunch_end == null) {
      return Text('Status: Currently On Lunch');
    }
    return Text('Status: Working');
  }

  Widget _buildActionBtns() {
    if (ref.watch(timecardProvider) == null ||
        ref.watch(timecardProvider)!.clock_in == null) {
      return ClockInBtn();
    }
    if (ref.watch(timecardProvider)!.clock_out != null) {
      return Text('You are done for the day!');
    }
    List<Widget> buttons = [];
    buttons.add(ClockOutBtn());
    if (ref.watch(timecardProvider)!.lunch_start == null) {
      buttons.add(LunchStartBtn());
    } else if (ref.watch(timecardProvider)!.lunch_end == null) {
      buttons.add(LunchEndBtn());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttons
          .map(
            (btn) => Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 8.0),
              child: btn,
            ),
          )
          .toList(),
    );
  }

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
            Row(children: [_buidStatusText()]),
            _buildActionBtns(),
          ],
        ),
      ),
    );
  }
}
