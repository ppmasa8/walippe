import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../providers/provider.dart';
import 'show_group_screen.dart';

class GroupMemberScreen extends ConsumerWidget {
  GroupMemberScreen(
      {super.key, required this.groupId, required this.groupName});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final int groupId;
  final String groupName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberListStream = ref.watch(memberListInGroupStream(groupId));
    final formValidator = ref.watch(formValidatorProvider);
    final textEditingController = ref.watch(textEditingControllerProvider);
    late String memberName;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          groupName,
          style: GoogleFonts.sawarabiGothic(
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
        children: [
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
                                .addMemberToGroup(groupId, memberName, 'test');
                            return ref
                                .refresh(memberListInGroupProvider(groupId));
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
                      return ref.refresh(memberListInGroupProvider(groupId));
                    },
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              // await Navigator.of(context).push<void>(MaterialPageRoute(
              //     builder: (context) => ProviderScope(child: GroupView(),),
              // ));
            },
            child: const Text(nextPage),
          ),
          Row(
            children: [
              memberListStream.when(
                data: (members) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: members.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(members[index].name),
                        );
                      },
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Text('Error: $error'),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Future<void> _deleteMember(WidgetRef ref) async {
    final memberListInGroup = ref.watch(memberListInGroupProvider(groupId));

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
