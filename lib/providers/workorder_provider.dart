import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workorder_provider.g.dart';

@riverpod
class Workorder extends _$Workorder {
  @override
  List<String> build() {
    return [];
  }

  void addToWos(String wo) {
    state = [...state, wo];
  }

  void removeWo(String wo) {
    final updatedList = [...state];
    updatedList.removeWhere((item) => item == wo);
    state = updatedList;
  }

  void clearWos() {
    state = [];
  }
}
