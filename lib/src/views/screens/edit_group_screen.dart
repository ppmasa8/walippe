import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../models/group_data.dart';
import '../../providers/provider.dart';

class EditGroupScreen extends ConsumerWidget {
  EditGroupScreen({super.key, required this.groupData});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GroupData groupData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberListStream = ref.watch(memberListInGroupStream(groupData.id));
    final formValidator = ref.watch(formValidatorProvider);
    final textEditingController = ref.watch(textEditingControllerProvider);
    late String memberName;

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
          // TODO: Add to update groupName unit.
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: memberLabelText,
                              hintText: memberFormHintText),
                          validator: formValidator.validateMemberName,
                          onChanged: (value) {
                            memberName = value;
                          },
                        ))
                  ],
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                        child: const Text(addText),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            textEditingController.clear();
                            await ref
                                .watch(memberRepositoryProvider)
                                .addMemberToGroup(
                                    groupData.id, memberName, 'test');
                            return ref.refresh(
                                memberListInGroupProvider(groupData.id));
                          }
                        })),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    child: const Text(deleteText),
                    onPressed: () async {
                      await _deleteMember(ref);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(deleteSnackBarText),
                          behavior: SnackBarBehavior.fixed,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return ref
                          .refresh(memberListInGroupProvider(groupData.id));
                    },
                  ),
                ),
              ),
            ],
          ),
          const Text(memberLabelText),
          memberListStream.when(
            data: (members) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: members.map((member) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(member.name),
                  );
                }).toList(),
              );
            },
            loading: () {
              return const CircularProgressIndicator();
            },
            error: (error, stackTrace) {
              return Text('Error: $error');
            },
          ),
        ],
      )),
    );
  }

  Future<void> _deleteMember(WidgetRef ref) async {
    final memberListInGroup = ref.watch(memberListInGroupProvider(groupData.id));

    await Future<void>.delayed(
      const Duration(milliseconds: memberDurationForDelete),
    );
    await ref.watch(memberRepositoryProvider).deleteMemberById(
          memberListInGroup.when(data: (memberList) {
            if (memberList.isNotEmpty) {
              int lastId = memberList.last.id;
              return lastId;
            } else {
              return 0;
            }
          }, loading: () {
            return 0;
          }, error: (error, stackTrace) {
            return 0;
          }),
        );
  }
}
