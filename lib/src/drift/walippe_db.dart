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
  IntColumn get memberIdOfPayInAdvance => integer().references(Members, #id)();
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

  // Transactions

  // Members
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
