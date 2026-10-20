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
    extends $NotifierProvider<EmployeeNotifier, Employee?> {
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
  Override overrideWithValue(Employee? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Employee?>(value),
    );
  }
}

String _$employeeNotifierHash() => r'810049f15385ff2f25e2bda4fda3b659d9db3184';

abstract class _$EmployeeNotifier extends $Notifier<Employee?> {
  Employee? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Employee?, Employee?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Employee?, Employee?>,
              Employee?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
