import 'package:flutter/material.dart';
import 'package:shop_barcode_scan_v3/models/employee.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TimecardService {
  Future<Map<String, dynamic>?> getEmpTodayTimecard(String uuid) async {
    DateTime today = DateTime.now();
    final String formattedDate = DateTime(
      today.year,
      today.month,
      today.day,
      0,
      0,
      0,
      0,
      0,
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
