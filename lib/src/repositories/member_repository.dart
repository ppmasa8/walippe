import '../drift/walippe_db.dart';
import '../models/member_data.dart';

class MemberRepository {
  const MemberRepository({required this.database});
  final WalippeDatabase database;

  Future<List<MemberData>> fetchMember() async {
    final members = await database.getAllMembers();
    return members
        .map((member) => MemberData(
              id: member.id,
              groupId: member.groupId,
              name: member.name,
              description: member.description,
              balance: member.balance,
              createdAt: member.createdAt,
              updatedAt: member.updatedAt,
            ))
        .toList();
  }

  Future<List<MemberData>> fetchMembersInGroup(int groupId) async {
    final members = await database.getMembersInGroup(groupId);
    return members
        .map((member) => MemberData(
              id: member.id,
              groupId: member.groupId,
              name: member.name,
              description: member.description,
              balance: member.balance,
              createdAt: member.createdAt,
              updatedAt: member.updatedAt,
            ))
        .toList();
  }

  Future<void> addMemberToGroup(
      int groupId, String name, String description) async {
    await database.addMember(groupId, name, description);
  }

  Future<void> deleteMemberById(int id) async {
    await database.deleteMember(id);
  }

  Future<void> deleteMemberByGroupId(int groupId) async {
    await database.deleteMemberByGroupId(groupId);
  }
}
