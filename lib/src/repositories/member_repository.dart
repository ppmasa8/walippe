import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/src/models/member_data.dart';

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
}
