import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/error_provider.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/screen_landscape.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/screen_portrait.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/emp_confirm.dart';
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
      'time': DateFormat('hh:mm a').format(DateTime.now()),
      'date': DateFormat('MM/dd/yyyy').format(DateTime.now()),
    };
  }

  // Widget _buidStatusText() {
  //   if (ref.watch(timecardProvider) == null ||
  //       ref.watch(timecardProvider)!.clock_in == null) {
  //     return Text('Status: Not Clocked In');
  //   }
  //   if (ref.watch(timecardProvider)!.clock_out != null) {
  //     return Text('Status: Shift Completed for Today');
  //   }
  //   if (ref.watch(timecardProvider)!.lunch_start != null &&
  //       ref.watch(timecardProvider)!.lunch_end == null) {
  //     return Text('Status: Currently On Lunch');
  //   }
  //   return Text('Status: Working');
  // }

  // Widget _buildActionBtns() {
  //   if (ref.watch(timecardProvider) == null ||
  //       ref.watch(timecardProvider)!.clock_in == null) {
  //     return ClockInBtn();
  //   }
  //   if (ref.watch(timecardProvider)!.clock_out != null) {
  //     return Text('You are done for the day!');
  //   }
  //   List<Widget> buttons = [];
  //   buttons.add(ClockOutBtn());
  //   if (ref.watch(timecardProvider)!.lunch_start == null) {
  //     buttons.add(LunchStartBtn());
  //   } else if (ref.watch(timecardProvider)!.lunch_end == null) {
  //     buttons.add(LunchEndBtn());
  //   }
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     children: buttons
  //         .map(
  //           (btn) => Padding(
  //             padding: EdgeInsetsGeometry.symmetric(vertical: 8.0),
  //             child: btn,
  //           ),
  //         )
  //         .toList(),
  //   );
  // }

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actionsPadding: EdgeInsets.only(right: 16),
        title: StreamBuilder(
          stream: Stream.periodic(Duration(hours: 1)),
          builder: (context, snapshot) {
            return Text(getTime()['date']);
          },
        ),
        actions: [
          StreamBuilder(
            stream: Stream.periodic(Duration(seconds: 1)),
            builder: (context, snapshot) {
              return Text(getTime()['time'], style: TextStyle(fontSize: 23));
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.all(19),
        child: MediaQuery.of(context).orientation == Orientation.landscape
            ? ScreenLandscape()
            : ScreenPortrait(),
      ),
    );
  }
}
