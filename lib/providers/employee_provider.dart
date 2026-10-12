import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_barcode_scan_v3/providers/stage_provider.dart';

part 'employee_provider.g.dart';

@riverpod
class Employee extends _$Employee {
  @override
  String build() {
    return '';
  }

  void setEmp(String emp) {
    ref.read(stageProvider.notifier).incrementStage();
    state = emp;
  }

  void clearEmp() {
    state = '';
  }
}
