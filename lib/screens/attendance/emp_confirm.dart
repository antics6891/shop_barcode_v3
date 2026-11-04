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
import 'package:shop_barcode_scan_v3/screens/attendance/components/timestamp_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmpConfirm extends ConsumerStatefulWidget {
  const EmpConfirm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmpConfirmState();
}

class _EmpConfirmState extends ConsumerState<EmpConfirm> {
  bool isLoading = false;
  TimecardModel? userTimecard;

  Future<void> fetchUserTimecard() async {
    try {
      final response = await TimecardService().getEmpTodayTimecard(
        ref.watch(employeeProvider)!.uuid,
      );
      if (!mounted) return;
      setState(() {
        userTimecard = response == null
            ? null
            : TimecardModel.fromJson(response);
      });
      print(response);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() => isLoading = true);
    fetchUserTimecard().then((_) {
      if (mounted) {
        setState(() => isLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final empRef = ref.watch(employeeProvider);

    Widget buildActionBtns() {
      List<Widget> buttons = [];

      if (userTimecard == null) {
        buttons.add(ClockInBtn());
      } else {
        if (userTimecard!.clock_in == null) {
          buttons.add(ClockInBtn());
        } else {
          buttons.add(
            // Text(DateFormat('h:mma').format(userTimecard!.clock_in!)),
            TimestampCard(
              label: 'Clock In',
              timestamp: userTimecard!.clock_in!,
            ),
          );
        }

        if (userTimecard!.lunch_start == null) {
          buttons.add(LunchStartBtn(dbUuid: userTimecard!.uuid));
        } else {
          buttons.add(
            TimestampCard(
              label: 'Lunch Start',
              timestamp: userTimecard!.lunch_start!,
            ),
          );
        }

        if (userTimecard!.lunch_start != null &&
            userTimecard!.lunch_end == null) {
          buttons.add(LunchEndBtn(dbUuid: userTimecard!.uuid));
        } else if (userTimecard!.lunch_end != null) {
          buttons.add(
            TimestampCard(
              label: 'Lunch End',
              timestamp: userTimecard!.lunch_end!,
            ),
          );
        }

        if (userTimecard!.clock_in != null && userTimecard!.clock_out == null) {
          buttons.add(Expanded(child: ClockOutBtn(dbUuid: userTimecard!.uuid)));
        } else {
          buttons.add(
            TimestampCard(
              label: 'Clock Out',
              timestamp: userTimecard!.clock_out!,
            ),
          );
        }
      }

      return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: AnimateList(
          interval: Duration(milliseconds: 300),

          effects: [FlipEffect()],
          children: buttons
              .map((e) => Padding(padding: EdgeInsetsGeometry.all(0), child: e))
              .toList(),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade700,
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(leading: BackButton(onPressed: () {})),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          spacing: 16,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(userTimecard),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userTimecard != null ? 'Welcome Back' : 'Welcome',
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
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 420),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Current Timecard',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    isLoading ? CircularProgressIndicator() : buildActionBtns(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
