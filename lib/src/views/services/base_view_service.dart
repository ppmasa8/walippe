class BaseViewService {
  Future<int> getLastGroupId(widget) async {
    final groupList = await widget.database.getAllGroups();
    return groupList.length - 1;
  }
}
