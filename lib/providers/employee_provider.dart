import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_provider.g.dart';

@riverpod
class Employee extends _$Employee {
  @override
  String build() {
    return 'Hello';
  }

  void setEmp(String emp) {
    state = emp;
  }

  void clearEmp() {
    state = '';
  }
}
