import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walippe/src/drift/walippe_db.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key, required this.database}) : super(key: key);

  final WalippeDatabase database;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  late String groupName;
  late String memberName;

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
            TextField(
                decoration:
                    const InputDecoration(labelText: 'グループ名', hintText: '沖縄旅行'),
                onChanged: (value) {
                  groupName = value;
                }),
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
                          '更新',
                        );
                      },
                    ),
                  );
                },
              ),
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
                        await widget.database.addMember(memberName, 'test');
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

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'グループ名',
        ),
      ),
    );
  }
}
