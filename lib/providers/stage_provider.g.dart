// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Stage)
final stageProvider = StageProvider._();

final class StageProvider extends $NotifierProvider<Stage, int> {
  StageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stageHash();

  @$internal
  @override
  Stage create() => Stage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$stageHash() => r'4fad18de2a09fbddd771c1cb19f4a3c4979c9ab2';

abstract class _$Stage extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
