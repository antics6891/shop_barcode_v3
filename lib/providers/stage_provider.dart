import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stage_provider.g.dart';

@riverpod
class Stage extends _$Stage {
  @override
  int build() {
    return 0;
  }

  void incrementStage() {
    if (state <= 3) {
      state++;
    }
  }

  void decrementStage() {
    if (state < 0) {
      state--;
    }
  }

  void resetStage() {
    state = 0;
  }
}
