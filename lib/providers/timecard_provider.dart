import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_barcode_scan_v3/models/timecard.dart';

part 'timecard_provider.g.dart';

@riverpod
class Timecard extends _$Timecard {
  @override
  TimecardModel? build() => null;

  void setTimecard(Map<String, dynamic> tc) {
    state = TimecardModel.fromJson(tc);
  }

  // Future<List> getTodayTimecard(String id) async {
  //   var cur = DateTime.now().toIso8601String();
  //   final resp = Supabase.instance.client
  //       .from('time_entries')
  //       .select()
  //       .eq('employee_id', id)
  //       .lte('start_time', cur);
  //   return resp;
  // }
}
