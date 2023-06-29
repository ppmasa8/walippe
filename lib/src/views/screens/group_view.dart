import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walippe/src/models/group_data.dart';

import '../../providers/provider.dart';
import 'create_transaction_screen.dart';

//TODO: FIX THIS
class GroupView extends ConsumerWidget {
  const GroupView({super.key, required this.groupData});

  final GroupData groupData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberListAsync = ref.watch(memberListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          groupData.name,
          style: GoogleFonts.dancingScript(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          memberListAsync.when(
              data: (memberList) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: memberList.length,
                    itemBuilder: (context, index) {
                      final member = memberList[index];
                      return ListTile(
                        title: Text(member.name),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
              error: (error, stackTrace) {
                return Text('Error: $error');
              },
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateTransactionScreen()));
            },
            child: const Text('立て替えた記録を追加'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
            child: const Text('グループを編集'),
          ),
        ],
      )),
    );
  }
}
