import '../drift/walippe_db.dart';
import '../models/group_data.dart';

class GroupRepository {
  const GroupRepository({required this.database});
  final WalippeDatabase database;

  Future<List<GroupData>> fetchGroups() async {
    final groups = await database.getAllGroups();
    return groups
        .map((group) => GroupData(
              id: group.id,
              name: group.name,
              description: group.description,
              createdAt: group.createdAt,
              updatedAt: group.updatedAt,
            ))
        .toList();
  }

  Future<GroupData> fetchGroupById(int id) async {
    final group = await database.getGroupById(id);
    return GroupData(
      id: group!.id,
      name: group.name,
      description: group.description,
      createdAt: group.createdAt,
      updatedAt: group.updatedAt,
    );
  }

  Future<int> addGroupByStringToDatabase(
      String name, String description) async {
    final groupId = await database.addGroup(name, description);
    return groupId;
  }

  Future<void> deleteGroupById(int id) async {
    await database.deleteGroup(id);
  }
}
