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
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('Transaction')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get groupId => integer().references(Groups, #id)();
  TextColumn get subject => text()();
  TextColumn get description => text().nullable()();
  IntColumn get payerId => integer().references(Members, #id)();
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
  TextColumn get description => text().nullable()();
  IntColumn get balance => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DriftDatabase(tables: [Groups, Transactions, Members])
class WalippeDatabase extends _$WalippeDatabase {
  WalippeDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Groups
  Stream<List<Group>> watchAllGroups() {
    return (select(groups)).watch();
  }

  Future<List<Group>> getAllGroups() => select(groups).get();

  Future<int> addGroup(String name, String description) {
    return into(groups).insert(GroupsCompanion(
      name: Value(name),
      description: Value(description),
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

  Future<List<Transaction>> getAllTransactions() => select(transactions).get();

  // Members
  Stream<List<Member>> watchAllMembers() {
    return (select(members)).watch();
  }

  Stream<List<Member>> watchMembersInGroup(int groupId) {
    return (select(members)..where((tbl) => tbl.groupId.equals(groupId)))
        .watch();
  }

  Future<List<Member>> getAllMembers() => select(members).get();

  Future<int> addMember(int groupId, String name, String description) {
    return into(members).insert(MembersCompanion(
      groupId: Value(groupId),
      name: Value(name),
      description: Value(description),
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
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
