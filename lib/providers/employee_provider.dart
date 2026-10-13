import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_provider.g.dart';

// @riverpod
// class Employee extends _$Employee {
//   @override
//   String build() => '';

//   void setEmp(String emp) {
//     state = emp;
//   }

//   void clearEmp() {
//     state = '';
//   }
// }
@riverpod
class EmployeeNotifier extends _$EmployeeNotifier {
  @override
  String build() {
    return '999';
  }

  void setEmployee(String id) {
    state = id;
  }
}
