// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timecard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Timecard)
final timecardProvider = TimecardProvider._();

final class TimecardProvider
    extends $NotifierProvider<Timecard, TimecardModel?> {
  TimecardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timecardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timecardHash();

  @$internal
  @override
  Timecard create() => Timecard();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TimecardModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TimecardModel?>(value),
    );
  }
}

String _$timecardHash() => r'9d77c7239e3fc67e2d54625aa4a535545dcb2c6b';

abstract class _$Timecard extends $Notifier<TimecardModel?> {
  TimecardModel? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TimecardModel?, TimecardModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TimecardModel?, TimecardModel?>,
              TimecardModel?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
