import 'package:supabase_flutter/supabase_flutter.dart';

class EmployeeService {
  Future<Map<String, dynamic>?> checkEmployee(String empId) async {
    final dbRes = await Supabase.instance.client
        .from('employees')
        .select('uuid,firstName:first_name,lastName:last_name')
        .eq('emp_id', empId)
        .eq('is_active', true);

    if (dbRes.isNotEmpty) {
      return dbRes.first;
    } else {
      return null;
    }
  }
}
