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
    extends $NotifierProvider<Timecard, List<dynamic>> {
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
  Override overrideWithValue(List<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<dynamic>>(value),
    );
  }
}

String _$timecardHash() => r'cda7c3b6f34c414cc044d5911e4701948620dc30';

abstract class _$Timecard extends $Notifier<List<dynamic>> {
  List<dynamic> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<dynamic>, List<dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<dynamic>, List<dynamic>>,
              List<dynamic>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
