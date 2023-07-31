import '../drift/walippe_db.dart';
import '../models/member_data.dart';

class MemberRepository {
  const MemberRepository({required this.database});
  final WalippeDatabase database;

  Future<List<MemberData>> fetchMembers() async {
    final members = await database.getAllMembers();
    return members
        .map((member) => MemberData(
              id: member.id,
              groupId: member.groupId,
              name: member.name,
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
              balance: member.balance,
              createdAt: member.createdAt,
              updatedAt: member.updatedAt,
            ))
        .toList();
  }

  Future<MemberData?> getMemberById(int id) async {
    final member = await database.getMember(id);
    return member != null
        ? MemberData(
            id: member.id,
            groupId: member.groupId,
            name: member.name,
            balance: member.balance,
            createdAt: member.createdAt,
            updatedAt: member.updatedAt,
          )
        : null;
  }

  Future<void> addMemberToDatabase(int groupId, String name) async {
    await database.addMember(groupId, name);
  }

  Future<void> deleteMemberById(int id) async {
    await database.deleteMember(id);
  }

  Future<void> deleteMemberByGroupId(int groupId) async {
    await database.deleteMembers(groupId);
  }
}
