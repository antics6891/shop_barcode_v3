import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/clock_in_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/clock_out_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/lunch_end_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/lunch_start_btn.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EmpConfirm extends ConsumerStatefulWidget {
  const EmpConfirm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmpConfirmState();
}

class _EmpConfirmState extends ConsumerState<EmpConfirm> {
  Widget _buildActionBtns() {
    if (ref.watch(timecardProvider) == null ||
        ref.watch(timecardProvider)!.clock_in == null) {
      return Animate(effects: [FlipEffect()], child: ClockInBtn());
    }
    if (ref.watch(timecardProvider)!.clock_out != null) {
      return Text('You are done for the day!');
    }
    List<Widget> buttons = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            ref.watch(timecardProvider.notifier).clearTimecard();
            ref.watch(employeeProvider.notifier).clearEmployee();
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 23,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome ${ref.watch(employeeProvider)!.firstName} ${ref.watch(employeeProvider)!.lastName}',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  SizedBox(width: 300, child: _buildActionBtns()),
                ],
              ),
            ),
            ref.watch(timecardProvider)!.clock_in != null
                ? SizedBox(height: 60, width: 200, child: ClockOutBtn())
                : Container(),
          ],
        ),
      ),
    );
  }
}
