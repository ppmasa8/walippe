import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../providers/provider.dart';

class AddMember extends ConsumerWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupListAsync = ref.watch(groupListProvider);
    return Scaffold(
      appBar: AppBar(
        title: groupListAsync.when(
          data: (groupList) {
            if (groupList.isNotEmpty) {
              String lastName = groupList.last.name;
              return Text(
                lastName,
                style: GoogleFonts.roboto(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            } else {
              return const Text('No groups available');
            }
          },
          loading: () {
            // データがまだ読み込まれていない場合の処理
            return const CircularProgressIndicator();
          },
          error: (error, stackTrace) {
            return Text('Error: $error');
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
