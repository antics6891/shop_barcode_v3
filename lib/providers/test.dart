import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test.g.dart';

@riverpod
Future<String?> test(Ref ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return null;
}
