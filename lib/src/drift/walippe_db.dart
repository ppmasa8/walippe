import 'package:drift/drift.dart';

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
  WalippeDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
