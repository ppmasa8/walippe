import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../drift/walippe_db.dart';
import '../../models/group_data.dart';
import '../../providers/provider.dart';
import '../../views/screens/group_view.dart';

class BaseView extends ConsumerWidget {
  BaseView({Key? key}) : super(key: key);

  // final formKey = GlobalKey<FormState>();

  // Future<int> getLastGroupId(widget) async {
  //   final groupList = await widget.database.getAllGroups();
  //   return groupList.length - 1;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late String groupName;
    // late String memberName;
    // late int groupId;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Walippe',
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
            // Form(
            //     key: formKey,
            //     child: Column(
            //       children: [
            TextFormField(
                decoration:
                    const InputDecoration(labelText: 'グループ名', hintText: '沖縄旅行'),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'グループ名を入力してください';
                //   }
                //   return null;
                // },
                onChanged: (value) {
                  groupName = value;
                }),
            //   ],
            // )),
            // TextField(
            //     decoration:
            //         const InputDecoration(labelText: 'メンバー名', hintText: 'なおみ'),
            //     onChanged: (value) {
            //       memberName = value;
            //     }),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                await ref
                    .watch(groupRepositoryProvider)
                    .addGroupByString(groupName, 'test');
                // if (formKey.currentState!.validate()) {
                // await widget.database.addGroup(groupName, 'test');
                // groupId = await getLastGroupId(widget);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => GroupView(groupName, groupId)));
                // }
              },
              child: const Text('グループを作成'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Expanded(
            //       child: Padding(
            //         padding: const EdgeInsets.all(8),
            //         child: ElevatedButton(
            //           child: const Text('追加'),
            //           onPressed: () async {
            //             await ref.watch(memberRepositoryProvider).addMemberToGroup( ,memberName, 'test');
            //             // groupId = await getLastGroupId(widget);
            //             // await widget.database
            //             //     .addMember(groupId, memberName, 'test');
            //           },
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Padding(
            //         padding: const EdgeInsets.all(8),
            //         child: ElevatedButton(
            //           child: const Text('削除'),
            //           onPressed: () async {
            //             // final list = await widget.database.getAllMembers();
            //             // if (list.isNotEmpty) {
            //             //   await widget.database
            //             //       .deleteMember(list[list.length - 1]);
            //             // }
            //           },
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
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
