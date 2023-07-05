// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walippeDatabaseHash() => r'45fa3284c32010e13fc21db9b978409a058196a8';

/// See also [walippeDatabase].
@ProviderFor(walippeDatabase)
final walippeDatabaseProvider = Provider<WalippeDatabase>.internal(
  walippeDatabase,
  name: r'walippeDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walippeDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WalippeDatabaseRef = ProviderRef<WalippeDatabase>;
String _$groupRepositoryHash() => r'796700c0107a3816162ee361140d81721dfe3203';

/// See also [groupRepository].
@ProviderFor(groupRepository)
final groupRepositoryProvider = AutoDisposeProvider<GroupRepository>.internal(
  groupRepository,
  name: r'groupRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroupRepositoryRef = AutoDisposeProviderRef<GroupRepository>;
String _$groupListHash() => r'8250ba5b781e593f67179e9045bcfd6ceb013dc7';

/// See also [groupList].
@ProviderFor(groupList)
final groupListProvider = AutoDisposeFutureProvider<List<GroupData>>.internal(
  groupList,
  name: r'groupListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$groupListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroupListRef = AutoDisposeFutureProviderRef<List<GroupData>>;
String _$transactionRepositoryHash() =>
    r'8219eca6f724787832b70877f15ba2ed8ec83382';

/// See also [transactionRepository].
@ProviderFor(transactionRepository)
final transactionRepositoryProvider =
    AutoDisposeProvider<TransactionRepository>.internal(
  transactionRepository,
  name: r'transactionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionRepositoryRef
    = AutoDisposeProviderRef<TransactionRepository>;
String _$transactionListHash() => r'860c312a6cd27d3ba150102ce819d1829572ab13';

/// See also [transactionList].
@ProviderFor(transactionList)
final transactionListProvider =
    AutoDisposeFutureProvider<List<TransactionData>>.internal(
  transactionList,
  name: r'transactionListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionListRef
    = AutoDisposeFutureProviderRef<List<TransactionData>>;
String _$memberRepositoryHash() => r'8159a59fe34e1dba8bda0341c8b98189d9954e64';

/// See also [memberRepository].
@ProviderFor(memberRepository)
final memberRepositoryProvider = AutoDisposeProvider<MemberRepository>.internal(
  memberRepository,
  name: r'memberRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$memberRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MemberRepositoryRef = AutoDisposeProviderRef<MemberRepository>;
String _$memberListInGroupHash() => r'edee16b6a815d446f7e48ba22a11554c018262eb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef MemberListInGroupRef = AutoDisposeFutureProviderRef<List<MemberData>>;

/// See also [memberListInGroup].
@ProviderFor(memberListInGroup)
const memberListInGroupProvider = MemberListInGroupFamily();

/// See also [memberListInGroup].
class MemberListInGroupFamily extends Family<AsyncValue<List<MemberData>>> {
  /// See also [memberListInGroup].
  const MemberListInGroupFamily();

  /// See also [memberListInGroup].
  MemberListInGroupProvider call(
    int groupId,
  ) {
    return MemberListInGroupProvider(
      groupId,
    );
  }

  @override
  MemberListInGroupProvider getProviderOverride(
    covariant MemberListInGroupProvider provider,
  ) {
    return call(
      provider.groupId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'memberListInGroupProvider';
}

/// See also [memberListInGroup].
class MemberListInGroupProvider
    extends AutoDisposeFutureProvider<List<MemberData>> {
  /// See also [memberListInGroup].
  MemberListInGroupProvider(
    this.groupId,
  ) : super.internal(
          (ref) => memberListInGroup(
            ref,
            groupId,
          ),
          from: memberListInGroupProvider,
          name: r'memberListInGroupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$memberListInGroupHash,
          dependencies: MemberListInGroupFamily._dependencies,
          allTransitiveDependencies:
              MemberListInGroupFamily._allTransitiveDependencies,
        );

  final int groupId;

  @override
  bool operator ==(Object other) {
    return other is MemberListInGroupProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
