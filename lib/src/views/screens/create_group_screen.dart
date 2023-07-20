import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../providers/provider.dart';
import 'group_member_screen.dart';

class CreateGroupScreen extends ConsumerWidget {
  CreateGroupScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formValidator = ref.watch(formValidatorProvider);
    late String groupName;

    return WillPopScope(
        child: Scaffold(
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
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: groupFormLabelText,
                                    hintText: groupFormHintText),
                                validator: formValidator.validateGroupName,
                                onChanged: (value) {
                                  groupName = value;
                                }),
                          )
                        ],
                      )),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final groupId = await ref
                          .watch(groupRepositoryProvider)
                          .addGroupByStringToDatabase(groupName);
                      await Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (context) => ProviderScope(
                            child: GroupMemberScreen(
                              groupId: groupId,
                              groupName: groupName,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(groupCreateButtonText),
                ),
              ],
            ))),
        onWillPop: () async {
          ref.invalidate(groupListProvider);
          return true;
        });
  }
}
