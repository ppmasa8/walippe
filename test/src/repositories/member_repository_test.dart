import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/src/repositories/member_repository.dart';

import 'walippe_db_test.mocks.dart';

void main() {
  group('MemberRepository', () {
    late MockWalippeDatabase mockDatabase;
    late MemberRepository repo;

    setUp(() {
      mockDatabase = MockWalippeDatabase();
      repo = MemberRepository(database: mockDatabase);
    });
    test('fetchMemberss returns a list of MemberData', () async {
      final dummyMemberList = [
        Member(
          id: 1,
          groupId: 1,
          name: 'John Doe',
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
      when(mockDatabase.getAllMembers()).thenAnswer((_) => Future.value([]));

      final result = await repo.fetchMembers();

      expect(result, isEmpty);
    });

    test('fetchMembersInGroup returns a list of MemberData', () async {
      const groupId = 1;

      final dummyMemberList = [
        Member(
          id: 1,
          groupId: 1,
          name: 'John Doe',
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
      const groupId = 1;

      when(mockDatabase.getMembersInGroup(groupId))
          .thenAnswer((_) => Future.value([]));

      final result = await repo.fetchMembersInGroup(groupId);

      expect(result, isEmpty);
    });

    test('addMemberToDatabase adds a member', () async {
      const groupId = 1;
      const name = 'John Doe';

      when(mockDatabase.addMember(groupId, name)).thenAnswer((_) async => 1);

      await repo.addMemberToDatabase(groupId, name);

      verify(mockDatabase.addMember(groupId, name)).called(1);
    });

    test('deleteMemberById deletes a member', () async {
      const id = 1;

      when(mockDatabase.deleteMember(id)).thenAnswer((_) async => 1);

      await repo.deleteMemberById(id);

      verify(mockDatabase.deleteMember(id)).called(1);
    });

    test('deleteMemberByGroupId deletes members', () async {
      const groupId = 1;

      when(mockDatabase.deleteMembers(groupId)).thenAnswer((_) async => 1);

      await repo.deleteMemberByGroupId(groupId);

      verify(mockDatabase.deleteMembers(groupId)).called(1);
    });
  });
}
