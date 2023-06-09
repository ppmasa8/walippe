import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../drift/walippe_db.dart';
import '../../models/group_data.dart';
import '../../providers/provider.dart';
import '../../views/screens/group_view.dart';

class BaseView extends ConsumerWidget {
  BaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalKey = ref.watch(formKeyProvider);
    late String groupName;

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
                key: globalKey,
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                await ref
                    .watch(groupRepositoryProvider)
                    .addGroupByString(groupName, 'test');
                if (globalKey.currentState!.validate()) {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => GroupView(groupName)));
                }
              },
              child: const Text('グループを作成'),
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
