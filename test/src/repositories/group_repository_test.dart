import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/src/repositories/group_repository.dart';

import 'walippe_db_test.mocks.dart';

void main() {
  group('GroupRepository', () {
    test('fetchGroups returns a list of GroupData', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = GroupRepository(database: mockDatabase);

      final dummyGroupList = [
        Group(
          id: 1,
          name: 'Group 1',
          description: 'Group 1 Description',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      when(mockDatabase.getAllGroups()).thenAnswer((_) => Future.value(dummyGroupList));

      final result = await repo.fetchGroups();

      expect(result, isNotEmpty);
      expect(result.first.id, dummyGroupList.first.id);
    });

    test('fetchGroups returns an empty list', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = GroupRepository(database: mockDatabase);

      when(mockDatabase.getAllGroups()).thenAnswer((_) => Future.value([]));

      final result = await repo.fetchGroups();

      expect(result, isEmpty);
    });

    test('addGroupByString returns an id', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = GroupRepository(database: mockDatabase);
      final name = 'Test Group';
      final description = 'Test Description';

      when(mockDatabase.addGroup(name, description)).thenAnswer((_) async => 1);

      final result = await repo.addGroupByString(name, description);

      verify(mockDatabase.addGroup(name, description)).called(1);

      expect(result, equals(1));
    });

    test('deleteGroupById deletes a group', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = GroupRepository(database: mockDatabase);
      final id = 1;

      when(mockDatabase.deleteGroup(id)).thenAnswer((_) async => 1);

      await repo.deleteGroupById(id);

      verify(mockDatabase.deleteGroup(id)).called(1);
    });
  });
}
