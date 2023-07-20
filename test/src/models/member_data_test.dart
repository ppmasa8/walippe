import 'package:flutter_test/flutter_test.dart';
import 'package:walippe/src/models/member_data.dart';

void main() {
  group('MemberData', () {
    late MemberData memberData;

    setUp(() {
      memberData = MemberData(
        id: 1,
        groupId: 1,
        name: 'John Doe',
        balance: 100,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    });

    test('should create a valid MemberData instance', () {
      expect(memberData, isA<MemberData>());
      expect(memberData.id, 1);
      expect(memberData.groupId, 1);
      expect(memberData.name, 'John Doe');
      expect(memberData.balance, 100);
      expect(memberData.createdAt, isA<DateTime>());
      expect(memberData.updatedAt, isA<DateTime>());
    });

    test('should have correct values when updating properties', () {
      final updatedMemberData = memberData.copyWith(
        name: 'Jane Smith',
        balance: 200,
      );

      expect(updatedMemberData, isA<MemberData>());
      expect(updatedMemberData.id, 1);
      expect(updatedMemberData.groupId, 1);
      expect(updatedMemberData.name, 'Jane Smith');
      expect(updatedMemberData.balance, 200);
      expect(updatedMemberData.createdAt, memberData.createdAt);
      expect(updatedMemberData.updatedAt, memberData.updatedAt);
    });
  });
}
