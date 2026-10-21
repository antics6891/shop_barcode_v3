import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_barcode_scan_v3/models/employee.dart';
import 'package:shop_barcode_scan_v3/models/timecard.dart';
import 'package:shop_barcode_scan_v3/providers/timecard_provider.dart' as tc;
import 'package:supabase_flutter/supabase_flutter.dart';

part 'employee_provider.g.dart';

@riverpod
class EmployeeNotifier extends _$EmployeeNotifier {
  @override
  Employee? build() {
    return null;
  }

  void checkEmployee(String id) async {
    List<Map<String, dynamic>> response = await Supabase.instance.client
        .from('employees')
        .select('uuid, firstName:first_name, lastName:last_name')
        .eq('emp_id', id)
        .eq('is_active', true);
    if (response.isNotEmpty) {
      state = Employee.fromJson(response.first);
      // check is user has attendance card for today
      final current = DateTime.now();
      final startDay = DateTime(current.year, current.month, current.day);
      final nextDay = startDay.add(Duration(days: 1));
      List<Map<String, dynamic>> attendanceCheck = await Supabase
          .instance
          .client
          .from('attendance')
          .select('id,uuid,emp_uuid,clock_in,lunch_start,lunch_end,clock_out')
          .eq('emp_uuid', state!.uuid)
          .gte('created_at', startDay)
          .lte('created_at', nextDay);

      if (attendanceCheck.isNotEmpty) {
        ref
            .read(tc.timecardProvider.notifier)
            .setTimecard(attendanceCheck.first);
      } else {
        // create a new attendance card
        final newCard = await Supabase.instance.client
            .from('attendance')
            .insert({'emp_uuid': response.first['uuid']})
            .select();
        ref.read(tc.timecardProvider.notifier).setTimecard(newCard.first);
      }
    }
  }
}
