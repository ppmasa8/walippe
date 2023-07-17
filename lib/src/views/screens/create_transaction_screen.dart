import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/group_data.dart';
import '../../models/member_data.dart';
import '../../providers/provider.dart';

class CreateTransactionScreen extends ConsumerStatefulWidget {
  const CreateTransactionScreen({Key? key, required this.groupData})
      : super(key: key);

  final GroupData groupData;

  @override
  _CreateTransactionScreenState createState() =>
      _CreateTransactionScreenState();
}

class _CreateTransactionScreenState
    extends ConsumerState<CreateTransactionScreen> {
  MemberData payer = MemberData(
    id: 0,
    groupId: 0,
    name: '',
    description: null,
    balance: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    final memberListInGroup =
        ref.watch(memberListInGroupProvider(widget.groupData.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.groupData.name,
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
            if (!members.map((member) => member.name).contains(payer.name)) {
              payer = members[0];
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<MemberData>(
                  items: members.map((member) {
                    return DropdownMenuItem<MemberData>(
                      value: member,
                      child: Text(member.name),
                    );
                  }).toList(),
                  value: payer,
                  onChanged: (value) {
                    setState(() {
                      payer = value!;
                    });
                  },
                ),
                const Text("が"),
              ],
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }
}
