// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Routing)
final routingProvider = RoutingProvider._();

final class RoutingProvider extends $NotifierProvider<Routing, String> {
  RoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routingHash();

  @$internal
  @override
  Routing create() => Routing();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$routingHash() => r'397d3398b0ebed5dd79624d958ffa12785688caf';

abstract class _$Routing extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
