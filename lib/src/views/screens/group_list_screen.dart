import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/provider.dart';

class GroupListScreen extends ConsumerWidget {
  const GroupListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupListAsync = ref.watch(groupListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Walippe'),
      ),
      body: groupListAsync.when(
        data: (groupList) {
          return ListView.builder(
            itemCount: groupList.length,
            itemBuilder: (context, index) {
              final group = groupList[index];
              return ListTile(
                title: Text(group.name),
                // 他のグループのプロパティを表示する場合はここに追加します
              );
            },
          );
        },
        loading: () => CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}
