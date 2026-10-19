import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'employee_provider.g.dart';

@riverpod
class EmployeeNotifier extends _$EmployeeNotifier {
  @override
  String build() {
    return '';
  }

  void checkEmployee(String id) async {
    final response = await Supabase.instance.client
        .from('employees')
        .select()
        .eq('emp_id', id);
    if (response.isNotEmpty) {
      state = response.first['emp_id'];
    }
  }
}
