// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Employee)
final employeeProvider = EmployeeProvider._();

final class EmployeeProvider
    extends $NotifierProvider<Employee, EmployeeModel?> {
  EmployeeProvider._()
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
  String debugGetCreateSourceHash() => _$employeeHash();

  @$internal
  @override
  Employee create() => Employee();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmployeeModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmployeeModel?>(value),
    );
  }
}

String _$employeeHash() => r'e728f0cbce987dd6e3d8c0078919854fcf5b5f98';

abstract class _$Employee extends $Notifier<EmployeeModel?> {
  EmployeeModel? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<EmployeeModel?, EmployeeModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EmployeeModel?, EmployeeModel?>,
              EmployeeModel?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
