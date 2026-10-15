// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EmployeeNotifier)
final employeeProvider = EmployeeNotifierProvider._();

final class EmployeeNotifierProvider
    extends $NotifierProvider<EmployeeNotifier, String> {
  EmployeeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeeNotifierHash();

  @$internal
  @override
  EmployeeNotifier create() => EmployeeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$employeeNotifierHash() => r'92c907a255d9fce991f0ab8416a1cdfa551e2bb3';

abstract class _$EmployeeNotifier extends $Notifier<String> {
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
