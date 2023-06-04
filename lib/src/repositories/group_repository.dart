import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/src/models/group_data.dart';

class GroupRepository {
  const GroupRepository({required this.database});
  final WalippeDatabase database;

  Future<List<GroupData>> fetchGroups() async {
    final groups = await database.getAllGroups();
    return groups.map((group) => GroupData(
      id: group.id,
      name: group.name,
      description: group.description,
      createdAt: group.createdAt,
      updatedAt: group.updatedAt,
    )).toList();
  }
}
