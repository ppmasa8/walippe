import 'package:flutter/material.dart';
import 'package:walippe/src/views/screens/group_list_screen.dart';

import 'const/const.dart';
import 'views/screens/create_group_screen.dart';

class Walippe extends StatelessWidget {
  const Walippe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GroupListScreen(),
    );
  }
}
