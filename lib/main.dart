import 'package:flutter/material.dart';
import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/views/screens/base_view.dart';

void main() {
  final database = WalippeDatabase();
  runApp(MyApp(database: database,));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.database,}) : super(key: key);

  final WalippeDatabase database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walippe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BaseView(database: database,),
    );
  }
}
