import 'package:drift/drift.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'walippe_db.g.dart';

@DataClassName('Group')
class Groups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('Transaction')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get groupId => integer().references(Groups, #id)();
  TextColumn get subject => text()();
  IntColumn get payerId => integer().references(Members, #id)();
  IntColumn get amount => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('TransactionDetail')
class TransactionDetails extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transactionId => integer().references(Transactions, #id)();
  IntColumn get payeeId => integer().references(Members, #id)();
  IntColumn get amount => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('Member')
class Members extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get groupId => integer().references(Groups, #id)();
  TextColumn get name => text()();
  IntColumn get balance => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DriftDatabase(tables: [Groups, Transactions, TransactionDetails, Members])
class WalippeDatabase extends _$WalippeDatabase {
  WalippeDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Groups
  Stream<List<Group>> watchAllGroups() {
    return (select(groups)).watch();
  }

  Future<List<Group>> getAllGroups() => select(groups).get();

  Future<Group?> getGroupById(int id) {
    return (select(groups)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> addGroup(String name) {
    return into(groups).insert(GroupsCompanion(
      name: Value(name),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<int> deleteGroup(int id) {
    return (delete(groups)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Transactions
  Stream<List<Transaction>> watchAllTransactions() {
    return (select(transactions)).watch();
  }

  Stream<List<Transaction>> watchTransactionsInGroup(int groupId) {
    return (select(transactions)..where((tbl) => tbl.groupId.equals(groupId)))
        .watch();
  }

  Future<List<Transaction>> getAllTransactions() => select(transactions).get();

  Future<List<Transaction>> getTransactionsInGroup(int groupId) {
    return (select(transactions)..where((tbl) => tbl.groupId.equals(groupId)))
        .get();
  }

  Future<int> addTransaction(
      int groupId, String subject, int payerId, int amount) {
    return into(transactions).insert(TransactionsCompanion(
      groupId: Value(groupId),
      subject: Value(subject),
      payerId: Value(payerId),
      amount: Value(amount),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<int> deleteTransaction(int id) {
    return (delete(transactions)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteTransactions(int groupId) {
    return (delete(transactions)..where((tbl) => tbl.groupId.equals(groupId)))
        .go();
  }

  // TransactionDetails
  Stream<List<TransactionDetail>> watchAllTransactionDetails() {
    return (select(transactionDetails)).watch();
  }

  Future<List<TransactionDetail>> getAllTransactionDetails() =>
      select(transactionDetails).get();

  Future<List<TransactionDetail>> getTransactionDetailsInTransaction(int transactionId) {
    return (select(transactionDetails)..where((tbl) => tbl.transactionId.equals(transactionId))).get();
  }

  Future<int> addTransactionDetail(int transactionId, int payeeId, int amount) {
    return into(transactionDetails).insert(TransactionDetailsCompanion(
      transactionId: Value(transactionId),
      payeeId: Value(payeeId),
      amount: Value(amount),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<int> deleteTransactionDetail(int id) {
    return (delete(transactionDetails)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteTransactionDetails(int transactionId) {
    return (delete(transactionDetails)..where((tbl) => tbl.transactionId.equals(transactionId))).go();
  }

  // Members
  Stream<List<Member>> watchAllMembers() {
    return (select(members)).watch();
  }

  Stream<List<Member>> watchMembersInGroup(int groupId) {
    return (select(members)..where((tbl) => tbl.groupId.equals(groupId)))
        .watch();
  }

  Future<List<Member>> getAllMembers() => select(members).get();

  Future<List<Member>> getMembersInGroup(int groupId) {
    return (select(members)..where((tbl) => tbl.groupId.equals(groupId))).get();
  }

  Future<int> addMember(int groupId, String name) {
    return into(members).insert(MembersCompanion(
      groupId: Value(groupId),
      name: Value(name),
      balance: const Value(0),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<int> updateMemberBalance(Member member, int balance) {
    return (update(members)..where((tbl) => tbl.id.equals(member.id))).write(
        MembersCompanion(
            balance: Value(balance), updatedAt: Value(DateTime.now())));
  }

  Future<int> deleteMember(int id) {
    return (delete(members)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteMembers(int groupId) {
    return (delete(members)..where((tbl) => tbl.groupId.equals(groupId))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
