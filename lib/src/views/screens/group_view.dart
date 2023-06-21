import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO: FIX THIS
class GroupView extends StatelessWidget {
  const GroupView({Key? key}) : super(key: key);

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
          // Text(
          //   groupName,
          // style: const TextStyle(
          //   fontSize: 32,
          //   fontWeight: FontWeight.bold,
          //   color: Colors.deepPurpleAccent
          // ),),
          // Text(groupId.toString()),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => GroupView()));
            },
            child: const Text('立て替えた記録を追加'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
            child: const Text('グループを編集'),
          ),
        ],
      )),
    );
  }
}
