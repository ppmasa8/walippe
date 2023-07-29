import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/transaction_data.dart';
import '../../providers/provider.dart';

class ShowTransactionScreen extends ConsumerWidget {
  const ShowTransactionScreen({super.key, required this.transactionData});

  final TransactionData transactionData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionDetailListAsync = ref
        .watch(transactionDetailListInTransactionProvider(transactionData.id));

    return Scaffold(
        appBar: AppBar(
          title: Text(
            transactionData.subject,
            style: GoogleFonts.sawarabiGothic(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Stack(
          children: [
            transactionDetailListAsync.when(
              data: (tDList) {
                return ListView.separated(
                  itemCount: tDList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tDList[index].payeeId.toString()),
                      trailing: Text(tDList[index].amount.toString()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            )
          ],
        ));
  }
}
