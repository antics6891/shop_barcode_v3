import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shop_barcode_scan_v3/api/timecard_service.dart';
import 'package:shop_barcode_scan_v3/models/timecard.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/clock_in_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/clock_out_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/lunch_end_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/lunch_start_btn.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmpConfirm extends ConsumerStatefulWidget {
  const EmpConfirm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmpConfirmState();
}

class _EmpConfirmState extends ConsumerState<EmpConfirm> {
  bool isLoading = false;
  TimecardModel? userTimecard;

  @override
  void initState() {
    super.initState();
    final what = TimecardService().getEmpTodayTimecard(
      ref.watch(employeeProvider)!.uuid,
    );

    what.then(
      // (value) => {ref.read(timecardProvider.notifier).setTimecard(value!)},
      (value) => print(value),
      // setState(() {
      //   if (value!.isNotEmpty) {
      //     userTimecard = TimecardModel.fromJson(value);
      //   }
      // }
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final empRef = ref.watch(employeeProvider);
    print(empRef);
    // final tcRef = ref.watch(timecardProvider);
    // print(userTimecard);

    // Widget buildActionBtns() {
    //   List<Widget> buttons = [];

    //   if (userTimecard == null) {
    //     buttons.add(ClockInBtn());
    //   } else {
    //     if (userTimecard!.clock_in == null) {
    //       buttons.add(ClockInBtn());
    //     } else {
    //       buttons.add(
    //         Text(DateFormat('h:mma').format(userTimecard!.clock_in!)),
    //       );
    //     }

    //     if (userTimecard!.lunch_start == null) {
    //       buttons.add(LunchStartBtn(dbUuid: userTimecard!.uuid));
    //     } else {
    //       final DateFormat df = DateFormat('HH:mm');

    //       String tt = DateFormat('h:mma').format(userTimecard!.lunch_start!);
    //       buttons.add(Text(tt));
    //     }

    //     if (userTimecard!.lunch_start != null &&
    //         userTimecard!.lunch_end == null) {
    //       buttons.add(LunchEndBtn(dbUuid: userTimecard!.uuid));
    //     } else {
    //       buttons.add(
    //         Text(DateFormat('h:mma').format(userTimecard!.lunch_end!)),
    //       );
    //     }
    //     if (userTimecard!.clock_in != null && userTimecard!.clock_out == null) {
    //       buttons.add(Expanded(child: ClockOutBtn(dbUuid: userTimecard!.uuid)));
    //     } else {
    //       buttons.add(
    //         Text(DateFormat('h:mma').format(userTimecard!.clock_out!)),
    //       );
    //     }
    //   }

    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: buttons
    //         .map((e) => Padding(padding: EdgeInsetsGeometry.all(12), child: e))
    //         .toList(),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(leading: BackButton(onPressed: () {})),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 23,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(userTimecard),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WELCOME',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${empRef!.firstName} ${empRef.lastName}',
                        // '${empRef.value!.firstName} ${empRef.value!.lastName}',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  // Row(children: [buildActionBtns()]),
                  // Row(children: [ClockInBtn()]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
