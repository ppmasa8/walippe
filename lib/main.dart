import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/providers/provider.dart';
import 'src/walippe.dart';
import 'src/drift/walippe_db.dart';

void main() {
  final database = WalippeDatabase();
  runApp(ProviderScope(overrides: [
    walippeDatabaseProvider.overrideWithValue(database),
  ], child: Walippe()));
}
