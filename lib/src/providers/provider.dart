import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../drift/walippe_db.dart';
import '../models/group_data.dart';
import '../models/member_data.dart';
import '../models/transaction_data.dart';
import '../models/transaction_detail_data.dart';
import '../repositories/group_repository.dart';
import '../repositories/member_repository.dart';
import '../repositories/transaction_repository.dart';
import '../repositories/transaction_detail_repository.dart';
import '../views/form_validator.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
WalippeDatabase walippeDatabase(WalippeDatabaseRef ref) {
  return WalippeDatabase();
}

@riverpod
GroupRepository groupRepository(GroupRepositoryRef ref) {
  return GroupRepository(database: ref.read(walippeDatabaseProvider));
}

@riverpod
Future<List<GroupData>> groupList(GroupListRef ref) {
  return ref.read(groupRepositoryProvider).fetchGroups();
}

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) {
  return TransactionRepository(database: ref.read(walippeDatabaseProvider));
}

@riverpod
Future<List<TransactionData>> transactionListInGroup(
    TransactionListInGroupRef ref, int groupId) {
  return ref.read(transactionRepositoryProvider).fetchTransactionsInGroup(groupId);
}

@riverpod
TransactionDetailRepository transactionDetailRepository(
    TransactionDetailRepositoryRef ref) {
  return TransactionDetailRepository(
      database: ref.read(walippeDatabaseProvider));
}

@riverpod
Future<List<TransactionDetailData>> transactionDetailListInTransaction(
    TransactionDetailListInTransactionRef ref, int transactionId) {
  return ref
      .read(transactionDetailRepositoryProvider)
      .fetchTransactionDetailsInTransaction(transactionId);
}

@riverpod
MemberRepository memberRepository(MemberRepositoryRef ref) {
  return MemberRepository(database: ref.read(walippeDatabaseProvider));
}

@riverpod
Future<List<MemberData>> memberListInGroup(
    MemberListInGroupRef ref, int groupId) {
  return ref.read(memberRepositoryProvider).fetchMembersInGroup(groupId);
}

final memberListInGroupStream =
    StreamProvider.autoDispose.family<List<MemberData>, int>((ref, groupId) {
  final memberListInGroupFuture =
      ref.watch(memberListInGroupProvider(groupId).future);
  return memberListInGroupFuture.asStream();
});

final transactionListInGroupStream =
    StreamProvider.autoDispose.family<List<TransactionData>, int>(
        (ref, groupId) {
  final transactionListInGroupFuture =
      ref.watch(transactionListInGroupProvider(groupId).future);
  return transactionListInGroupFuture.asStream();
});

final textEditingControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final formValidatorProvider = Provider((ref) => FormValidator());
