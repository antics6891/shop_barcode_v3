import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shop_barcode_scan_v3/providers/error_provider.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/screen_landscape.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/screen_portrait.dart';
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
        title: Text(
          'Attendance Kiosk',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        // leading: StreamBuilder(
        //   stream: Stream.periodic(Duration(hours: 1)),
        //   builder: (context, snapshot) {
        //     return Text(getTime()['date']);
        //   },
        // ),
        actions: [
          StreamBuilder(
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
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.all(19),
        // child: MediaQuery.of(context).orientation == Orientation.landscape
        //     ? ScreenLandscape()
        //     : ScreenPortrait(),
        child: ScreenLandscape(),
      ),
    );
  }
}
