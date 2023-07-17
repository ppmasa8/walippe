import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/group_data.dart';
import '../../providers/provider.dart';

class CreateTransactionScreen extends ConsumerWidget {
  const CreateTransactionScreen({super.key, required this.groupData});

  final GroupData groupData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberListInGroup =
        ref.watch(memberListInGroupProvider(groupData.id));
    String isSelectedValue = '';

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
        child: memberListInGroup.when(
          data: (members) {
            if (!members
                .map((member) => member.name)
                .contains(isSelectedValue)) {
              isSelectedValue = members[0].name;
            }
            return DropdownButton<String>(
              items: members.map((member) {
                return DropdownMenuItem<String>(
                  value: member.name,
                  child: Text(member.name),
                );
              }).toList(),
              value: isSelectedValue,
              onChanged: (value) {
                isSelectedValue = value!;
              },
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }
}
