import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../providers/provider.dart';
import 'add_member.dart';

class BaseView extends ConsumerWidget {
  BaseView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formValidator = ref.watch(formValidatorProvider);
    late String groupName;

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
        body: Center(
            child: Column(
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                            labelText: groupFormLabelText,
                            hintText: groupFormHintText),
                        validator: formValidator.validateGroupName,
                        onChanged: (value) {
                          groupName = value;
                        }),
                  ],
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await ref
                      .watch(groupRepositoryProvider)
                      .addGroupByString(groupName, 'test');
                  await Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) => ProviderScope(
                        child: AddMember(),
                      ),
                    ),
                  );
                }
              },
              child: const Text(groupCreateButtonText),
            ),
          ],
        )));
  }
}


// class TextFieldWidget extends StatelessWidget {
//   const TextFieldWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       width: 300,
//       child: TextField(
//         obscureText: true,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           labelText: 'グループ名',
//         ),
//       ),
//     );
//   }
// }
