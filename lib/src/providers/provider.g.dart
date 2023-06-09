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
String _$memberListHash() => r'b194b5e69daedbd0fdf76ac784725becf2eadfc6';

/// See also [memberList].
@ProviderFor(memberList)
final memberListProvider = AutoDisposeFutureProvider<List<MemberData>>.internal(
  memberList,
  name: r'memberListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$memberListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MemberListRef = AutoDisposeFutureProviderRef<List<MemberData>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
