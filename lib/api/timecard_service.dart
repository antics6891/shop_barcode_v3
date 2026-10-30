import 'package:shop_barcode_scan_v3/models/employee.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TimecardService {
  Future<Map<String, dynamic>?> getEmpTodayTimecard(String uuid) async {
    List<Map<String, dynamic>> response = await Supabase.instance.client
        .from('employees')
        .select('uuid, firstName:first_name, lastName:last_name')
        .eq('emp_id', uuid)
        .eq('is_active', true);

    if (response.isNotEmpty) {
      return response.first;
    } else {
      return null;
    }
  }

  Future<String> createEmployeeTimecard(String empUuid) async {
    final what = await Supabase.instance.client.from('attendance').insert({
      'emp_uuid',
      empUuid,
    }).select();
    if (what.isNotEmpty) {
      return 'good';
    } else {
      return 'bad';
    }
  }
}
