import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/src/repositories/member_repository.dart';

import 'walippe_db_test.mocks.dart';

void main() {
  group('MemberRepository', () {
    test('fetchMemberss returns a list of MemberData', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = MemberRepository(database: mockDatabase);

      final dummyMemberList = [
        Member(
          id: 1,
          groupId: 1,
          name: 'John Doe',
          description: 'Sample member',
          balance: 100,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      when(mockDatabase.getAllMembers())
          .thenAnswer((_) => Future.value(dummyMemberList));

      final result = await repo.fetchMembers();

      expect(result, isNotEmpty);
      expect(result.first.id, dummyMemberList.first.id);
    });

    test('fetchMembers returns an empty list', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = MemberRepository(database: mockDatabase);

      when(mockDatabase.getAllMembers()).thenAnswer((_) => Future.value([]));

      final result = await repo.fetchMembers();

      expect(result, isEmpty);
    });

    test('fetchMembersInGroup returns a list of MemberData', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = MemberRepository(database: mockDatabase);
      final groupId = 1;

      final dummyMemberList = [
        Member(
          id: 1,
          groupId: 1,
          name: 'John Doe',
          description: 'Sample member',
          balance: 100,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      when(mockDatabase.getMembersInGroup(groupId))
          .thenAnswer((_) => Future.value(dummyMemberList));

      final result = await repo.fetchMembersInGroup(groupId);

      expect(result, isNotEmpty);
      expect(result.first.id, dummyMemberList.first.id);
    });

    test('fetchMembersInGroup returns an empty list', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = MemberRepository(database: mockDatabase);
      final groupId = 1;

      when(mockDatabase.getMembersInGroup(groupId))
          .thenAnswer((_) => Future.value([]));

      final result = await repo.fetchMembersInGroup(groupId);

      expect(result, isEmpty);
    });

    test('addMemberToDatabase adds a member', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = MemberRepository(database: mockDatabase);
      final groupId = 1;
      final name = 'John Doe';
      final description = 'Sample member';

      when(mockDatabase.addMember(groupId, name, description))
          .thenAnswer((_) async => 1);

      await repo.addMemberToDatabase(groupId, name, description);

      verify(mockDatabase.addMember(groupId, name, description)).called(1);
    });

    test('deleteMemberById deletes a member', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = MemberRepository(database: mockDatabase);
      final id = 1;

      when(mockDatabase.deleteMember(id)).thenAnswer((_) async => 1);

      await repo.deleteMemberById(id);

      verify(mockDatabase.deleteMember(id)).called(1);
    });

    test('deleteMemberByGroupId deletes members', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = MemberRepository(database: mockDatabase);
      final groupId = 1;

      when(mockDatabase.deleteMemberByGroupId(groupId))
          .thenAnswer((_) async => 1);

      await repo.deleteMemberByGroupId(groupId);

      verify(mockDatabase.deleteMemberByGroupId(groupId)).called(1);
    });
  });
}
