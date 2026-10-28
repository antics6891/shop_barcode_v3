// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IsError)
final isErrorProvider = IsErrorProvider._();

final class IsErrorProvider
    extends $NotifierProvider<IsError, Map<String, dynamic>?> {
  IsErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isErrorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isErrorHash();

  @$internal
  @override
  IsError create() => IsError();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, dynamic>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, dynamic>?>(value),
    );
  }
}

String _$isErrorHash() => r'8d75084f428f0ad7dac59dd05b416454fe46e5d1';

abstract class _$IsError extends $Notifier<Map<String, dynamic>?> {
  Map<String, dynamic>? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Map<String, dynamic>?, Map<String, dynamic>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, dynamic>?, Map<String, dynamic>?>,
              Map<String, dynamic>?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
