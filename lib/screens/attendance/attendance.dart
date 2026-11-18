import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shop_barcode_scan_v3/api/auth_service.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/error_provider.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/emp_timecard.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/id_input.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/week_fab.dart';
import 'package:toastification/toastification.dart';

class Attendance extends ConsumerStatefulWidget {
  const Attendance({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AttendanceState();
}

class _AttendanceState extends ConsumerState<Attendance> {
  final controller = TextEditingController();

  Map<String, dynamic> getTime() {
    return {
      'time': DateFormat('h:mm a').format(DateTime.now()),
      'date': DateFormat('MM/dd/yyyy').format(DateTime.now()),
    };
  }

  final isError = false;
  @override
  Widget build(BuildContext context) {
    ref.listen(isErrorProvider, (previous, next) {
      if (next != null) {
        toastification.show(
          alignment: Alignment.bottomCenter,
          autoCloseDuration: Duration(seconds: 2),
          style: ToastificationStyle.flatColored,
          type: ToastificationType.error,
          title: Text(next['message']),
          callbacks: ToastificationCallbacks(
            onAutoCompleteCompleted: (value) => controller.clear(),
          ),
        );
      }
    });

    return Scaffold(
      // floatingActionButton: WeekFab(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey.shade200,
        elevation: 2,
        actionsPadding: EdgeInsets.only(right: 16),

        title: StreamBuilder(
          stream: Stream.periodic(Duration(seconds: 1)),
          builder: (context, snapshot) {
            return Row(
              children: [
                Text(getTime()['date'], style: TextStyle(fontSize: 21)),
                SizedBox(width: 8),
                Text(getTime()['time'], style: TextStyle(fontSize: 21)),
              ],
            );
          },
        ),

        actions: [
          ref.watch(employeeProvider) == null
              ? IconButton(
                  onPressed: () {
                    AuthService().signOut();
                  },
                  icon: Icon(Icons.logout_outlined),
                )
              : IconButton(
                  color: Colors.transparent,
                  onPressed: () {
                    ref.watch(employeeProvider.notifier).clearEmployee();
                  },
                  icon: Icon(Icons.refresh_outlined, color: Colors.red),
                ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: ref.watch(employeeProvider) == null ? IdInput() : EmpTimecard(),
      ),
    );
  }
}
