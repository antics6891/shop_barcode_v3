// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workorder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Workorder)
final workorderProvider = WorkorderProvider._();

final class WorkorderProvider
    extends $NotifierProvider<Workorder, List<String>> {
  WorkorderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workorderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workorderHash();

  @$internal
  @override
  Workorder create() => Workorder();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$workorderHash() => r'90ca74e23bb9b3b164028c9d9ff198602c4b4f39';

abstract class _$Workorder extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
