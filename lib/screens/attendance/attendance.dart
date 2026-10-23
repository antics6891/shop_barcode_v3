import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/emp_confirm.dart';
// import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';
// import 'package:shop_barcode_scan_v3/screens/attendance/components/clock_in_btn.dart';
// import 'package:shop_barcode_scan_v3/screens/attendance/components/clock_out_btn.dart';
// import 'package:shop_barcode_scan_v3/screens/attendance/components/id_input.dart';
// import 'package:shop_barcode_scan_v3/screens/attendance/components/lunch_end_btn.dart';
// import 'package:shop_barcode_scan_v3/screens/attendance/components/lunch_start_btn.dart';
// import 'package:shop_barcode_scan_v3/screens/attendance/emp_confirm.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_keypad/virtual_keypad.dart';

class Attendance extends ConsumerStatefulWidget {
  const Attendance({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AttendanceState();
}

final pinLayout = [
  [
    VirtualKey.character(text: '1'),
    VirtualKey.character(text: '2'),
    VirtualKey.character(text: '3'),
  ],
  [
    VirtualKey.character(text: '4'),
    VirtualKey.character(text: '5'),
    VirtualKey.character(text: '6'),
  ],
  [
    VirtualKey.character(text: '7'),
    VirtualKey.character(text: '8'),
    VirtualKey.character(text: '9'),
  ],
  [
    VirtualKey.action(action: KeyAction.backSpace),
    VirtualKey.character(text: '0'),
    VirtualKey.action(action: KeyAction.done, label: '✓'),
  ],
];

class _AttendanceState extends ConsumerState<Attendance> {
  final controller = TextEditingController();

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
    ref.listen(employeeProvider, (previous, next) {
      if (next != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EmpConfirm()),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.all(19),
        child: Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: Column(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.punch_clock_outlined, size: 41),
                        Text(
                          'ATTENDANCE KIOSK',
                          style: TextStyle(fontSize: 27),
                        ),
                        SizedBox(
                          width: 200,
                          child: DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              color: Colors.grey.shade400,
                              radius: Radius.circular(8),
                              dashPattern: [10, 5],
                              padding: EdgeInsets.all(16),
                            ),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'No Notifications',
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  spacing: 24,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text('Enter ID Number', style: TextStyle(fontSize: 21)),
                    Icon(Icons.badge_outlined, size: 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(label: Text("ID Number")),
                        controller: controller,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    VirtualKeypad(
                      theme: VirtualKeypadTheme(
                        backgroundColor: Colors.white,
                        keyColor: Colors.grey.shade100,
                        keyShadow: true,
                        verticalGap: 10,
                        horizontalGap: 10,
                        actionKeyColor: Colors.blue.shade600,
                        keyBorderRadius: 9,
                      ),
                      customLayout: pinLayout,
                      type: KeyboardType.custom,
                      standalone: true,
                      onStandaloneInputAction: (action, text) async {
                        if (action == KeyAction.done &&
                            controller.text.isNotEmpty) {
                          ref
                              .watch(employeeProvider.notifier)
                              .checkEmployee(controller.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // child: Column(
        //   spacing: 16,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           'ATTENDANCE KIOSK',
        //           style: TextStyle(fontSize: 28, letterSpacing: 1.15),
        //         ),
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         ref.watch(timecardProvider) == null
        //             ? ConstrainedBox(
        //                 constraints: BoxConstraints(maxWidth: 300),
        //                 child: IdInput(),
        //               )
        //             : Text(ref.watch(employeeProvider)!.firstName.toString()),
        //       ],
        //     ),
        //     Row(children: [_buidStatusText()]),
        //     _buildActionBtns(),
        //   ],
        // ),
      ),
    );
  }
}
