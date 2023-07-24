import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/src/repositories/group_repository.dart';

import 'walippe_db_test.mocks.dart';

void main() {
  group('GroupRepository', () {
    late MockWalippeDatabase mockDatabase;
    late GroupRepository repo;

    setUp(() {
      mockDatabase = MockWalippeDatabase();
      repo = GroupRepository(database: mockDatabase);
    });
    test('fetchGroups returns a list of GroupData', () async {
      final dummyGroupList = [
        Group(
          id: 1,
          name: 'Group 1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      when(mockDatabase.getAllGroups())
          .thenAnswer((_) => Future.value(dummyGroupList));

      final result = await repo.fetchGroups();

      expect(result, isNotEmpty);
      expect(result.first.id, dummyGroupList.first.id);
    });

    test('fetchGroups returns an empty list', () async {
      when(mockDatabase.getAllGroups()).thenAnswer((_) => Future.value([]));

      final result = await repo.fetchGroups();

      expect(result, isEmpty);
    });

    test('addGroupByStringToDatabase returns an id', () async {
      const name = 'Test Group';

      when(mockDatabase.addGroup(name)).thenAnswer((_) async => 1);

      final result = await repo.addGroupByStringToDatabase(name);

      verify(mockDatabase.addGroup(name)).called(1);

      expect(result, equals(1));
    });

    test('deleteGroupById deletes a group', () async {
      const id = 1;

      when(mockDatabase.deleteGroup(id)).thenAnswer((_) async => 1);

      await repo.deleteGroupById(id);

      verify(mockDatabase.deleteGroup(id)).called(1);
    });
  });
}
