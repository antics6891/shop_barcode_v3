import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'timecard_provider.g.dart';

@riverpod
class Timecard extends _$Timecard {
  @override
  List build() => [];

  Future<List> getTodayTimecard(String id) async {
    var cur = DateTime.now().toIso8601String();
    final resp = Supabase.instance.client
        .from('time_entries')
        .select()
        .eq('employee_id', id)
        .lte('start_time', cur);
    return resp;
  }
}
