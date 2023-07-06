import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../models/group_data.dart';
import '../../providers/provider.dart';

class EditGroupScreen extends ConsumerWidget {
  const EditGroupScreen({super.key, required this.groupData});

  final GroupData groupData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberListStream = ref.watch(memberListInGroupStream(groupData.id));

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
        child: Text('Edit Group Screen'),
      ),
    );
  }
}
