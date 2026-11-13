import 'package:supabase_flutter/supabase_flutter.dart';

class TimecardService {
  Future<Map<String, dynamic>?> getEmpTodayTimecard(String uuid) async {
    DateTime today = DateTime.now();
    final String formattedDate = DateTime(
      today.year,
      today.month,
      today.day,
    ).toIso8601String();
    print(formattedDate);
    List<Map<String, dynamic>> response = await Supabase.instance.client
        .from('attendance')
        .select()
        .eq('emp_uuid', uuid)
        .gte('created_at', formattedDate);

    if (response.isNotEmpty) {
      print(response);
      return response.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> createEmployeeTimecard(
    String empUuid,
  ) async {
    DateTime today = DateTime.now();
    final String dateOnly = DateTime(
      today.year,
      today.month,
      today.day,
    ).toIso8601String();

    final what = await Supabase.instance.client.from('attendance').insert({
      'clock_in': DateTime.now().toIso8601String(),
      'emp_uuid': empUuid,
      'created_at': dateOnly,
    }).select();

    return what;
  }
}
