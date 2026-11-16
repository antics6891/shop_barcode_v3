import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_barcode_scan_v3/api/timecard_service.dart';
import 'package:shop_barcode_scan_v3/models/timecard.dart';
import 'package:shop_barcode_scan_v3/providers/employee_provider.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/clock_in_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/clock_out_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/lunch_end_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/lunch_start_btn.dart';
import 'package:shop_barcode_scan_v3/screens/attendance/components/timestamp_card.dart';

class EmpTimecard extends ConsumerStatefulWidget {
  const EmpTimecard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IdInputState();
}

class _IdInputState extends ConsumerState<EmpTimecard> {
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
          TimestampCard(label: 'Clock In', timestamp: userTimecard!.clock_in!),
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
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

  @override
  Widget build(BuildContext context) {
    final empRef = ref.watch(employeeProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${empRef!.firstName} ${empRef.lastName}',
              // '${empRef.value!.firstName} ${empRef.value!.lastName}',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
            ),
            Text(
              'ID: ${empRef.empId}',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
        Divider(),
        userTimecard != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Today\'s Timecard',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                  ),
                ],
              )
            : SizedBox.shrink(),
        isLoading ? CircularProgressIndicator() : buildActionBtns(),
      ],
    );
  }
}
