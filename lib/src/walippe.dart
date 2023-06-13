import 'package:flutter/material.dart';

import 'views/screens/base_view.dart';

class Walippe extends StatelessWidget {
  const Walippe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walippe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BaseView(),
    );
  }
}
