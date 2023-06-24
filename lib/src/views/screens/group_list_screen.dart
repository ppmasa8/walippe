import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../providers/provider.dart';
import 'create_group_screen.dart';
import 'edit_group_screen.dart';
import 'group_view.dart';

class GroupListScreen extends ConsumerWidget {
  const GroupListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupListAsync = ref.watch(groupListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleName,
          style: GoogleFonts.dancingScript(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Stack(
        children: [
          groupListAsync.when(
            data: (groupList) {
              return ListView.separated(
                itemCount: groupList.length,
                itemBuilder: (context, index) {
                  final group = groupList[index];

                  return ListTile(
                    title: Text(group.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.of(context).push<void>(
                              MaterialPageRoute(
                                builder: (context) => ProviderScope(
                                  child: EditGroupScreen(),
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await ref
                                .watch(groupRepositoryProvider)
                                .deleteGroupById(group.id);
                            await ref
                                .watch(memberRepositoryProvider)
                                .deleteMemberByGroupId(group.id);
                            // TODO: Add transaction version of delete.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(deleteSnackBarText),
                                behavior: SnackBarBehavior.fixed,
                                duration: Duration(seconds: 2),
                              ),
                            );
                            return ref.refresh(groupListProvider);
                          },
                        ),
                      ],
                    ),
                    onTap: () async {
                      await Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (context) => ProviderScope(
                            child: GroupView(),
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 0.5,
                  );
                },
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push<void>(
                  MaterialPageRoute(
                    builder: (context) => ProviderScope(
                      child: CreateGroupScreen(),
                    ),
                  ),
                );
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
