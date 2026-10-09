import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routing_provider.g.dart';

@riverpod
class Routing extends _$Routing {
  @override
  String build() {
    return '';
  }

  void setNewRoute(String newRout) {
    state = newRout;
  }

  void clearRoute() {
    state = '';
  }
}
