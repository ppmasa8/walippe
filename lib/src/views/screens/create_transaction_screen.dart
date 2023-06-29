import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../providers/provider.dart';

class CreateTransactionScreen extends ConsumerWidget {
  const CreateTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupListAsync = ref.watch(groupListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('s')),
      body: Center(
        child: Text('Create Transaction Screen'),
      ),
    );
  }
}