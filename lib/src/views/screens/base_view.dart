import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/src/views/services/base_view_service.dart';
import 'package:walippe/src/views/screens/group_view.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key, required this.database}) : super(key: key);

  final WalippeDatabase database;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final BaseViewService _service = BaseViewService();

  final formKey = GlobalKey<FormState>();

  late String groupName;
  late String memberName;
  late int groupId;
  // List? members = [];

  @override
  Widget build(BuildContext context) {
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
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'グループ名', hintText: '沖縄旅行'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'グループ名を入力してください';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          groupName = value;
                        }),
                  ],
                )),
            TextField(
                decoration:
                    const InputDecoration(labelText: 'メンバー名', hintText: 'なおみ'),
                onChanged: (value) {
                  memberName = value;
                }),
            Expanded(
              child: StreamBuilder(
                stream: widget.database.watchAllMembers(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Member>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => TextButton(
                      child: Text(snapshot.data![index].name),
                      onPressed: () async {
                        await widget.database.updateMember(
                          snapshot.data![index],
                          '',
                          '',
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  // members!.add(memberName);
                  await widget.database.addGroup(groupName, 'test');
                  groupId = await _service.getLastGroupId(widget);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroupView(groupName, groupId)));
                }
              },
              child: const Text('グループを作成'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      child: const Text('追加'),
                      onPressed: () async {
                        // members!.add(memberName);
                        groupId = await _service.getLastGroupId(widget);
                        await widget.database
                            .addMember(groupId, memberName, 'test');
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      child: const Text('削除'),
                      onPressed: () async {
                        final list = await widget.database.getAllMembers();
                        if (list.isNotEmpty) {
                          await widget.database
                              .deleteMember(list[list.length - 1]);
                        }
                      },
                    ),
                  ),
                ),
              ],
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
