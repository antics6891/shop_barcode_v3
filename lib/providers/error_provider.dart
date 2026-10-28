import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_provider.g.dart';

@riverpod
class IsError extends _$IsError {
  @override
  Map<String, dynamic>? build() {
    return null;
  }

  void setError(bool hasError, String message) {
    state = {'hasError': hasError, 'message': message};
  }

  void clearError() {
    state = null;
  }
}
