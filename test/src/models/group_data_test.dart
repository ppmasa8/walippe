import 'package:flutter_test/flutter_test.dart';
import 'package:walippe/src/models/group_data.dart';

void main() {
  group('GroupData', () {
    late GroupData groupData;

    setUp(() {
      groupData = GroupData(
        id: 1,
        name: 'Test Group',
        description: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    });

    test('should create a valid GroupData instance', () {
      expect(groupData, isA<GroupData>());
      expect(groupData.id, 1);
      expect(groupData.name, 'Test Group');
      expect(groupData.description, null);
      expect(groupData.createdAt, isA<DateTime>());
      expect(groupData.updatedAt, isA<DateTime>());
    });

    test('should have correct values when updating properties', () {
      final updatedGroupData = groupData.copyWith(
        name: 'Updated Group',
        description: 'This is an updated group',
      );

      expect(updatedGroupData, isA<GroupData>());
      expect(updatedGroupData.id, 1);
      expect(updatedGroupData.name, 'Updated Group');
      expect(updatedGroupData.description, 'This is an updated group');
      expect(updatedGroupData.createdAt, groupData.createdAt);
      expect(updatedGroupData.updatedAt, groupData.updatedAt);
    });
  });
}