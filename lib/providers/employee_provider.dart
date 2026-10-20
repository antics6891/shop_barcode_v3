import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_barcode_scan_v3/models/employee.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'employee_provider.g.dart';

@riverpod
class EmployeeNotifier extends _$EmployeeNotifier {
  @override
  Employee? build() {
    return null;
  }

  void checkEmployee(String id) async {
    final response = await Supabase.instance.client
        .from('employees')
        .select('uuid, firstName:first_name, lastName:last_name')
        .eq('emp_id', id)
        .eq('is_active', true);

    if (response.isNotEmpty) {
      state = Employee.fromJson(response.first);
      print(state);
    } else {
      print('nothing');
    }
  }
}
