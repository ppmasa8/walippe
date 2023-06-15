import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../drift/walippe_db.dart';
import '../models/group_data.dart';
import '../models/member_data.dart';
import '../models/transaction_data.dart';
import '../repositories/group_repository.dart';
import '../repositories/member_repository.dart';
import '../repositories/transaction_repository.dart';
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
Future<List<TransactionData>> transactionList(TransactionListRef ref) {
  return ref.read(transactionRepositoryProvider).fetchTransactions();
}

@riverpod
MemberRepository memberRepository(MemberRepositoryRef ref) {
  return MemberRepository(database: ref.read(walippeDatabaseProvider));
}

@riverpod
Future<List<MemberData>> memberList(MemberListRef ref) {
  return ref.read(memberRepositoryProvider).fetchMember();
}

final memberListStreamProvider = StreamProvider.autoDispose<List<MemberData>>((ref) {
  final memberListFuture = ref.watch(memberListProvider.future);
  return memberListFuture.asStream();
});

final textEditingControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final formValidatorProvider = Provider((ref) => FormValidator());
