import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/member_data.dart';
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
                  return FutureBuilder<MemberData?>(
                    future: ref
                        .watch(memberRepositoryProvider)
                        .getMemberById(tDList[index].payeeId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('エラー: ${snapshot.error}');
                        }

                        final memberData = snapshot.data;

                        return ListTile(
                          title: FutureBuilder<MemberData?>(
                            future: ref
                                .watch(memberRepositoryProvider)
                                .getMemberById(transactionData.payerId),
                            builder: (context, payerSnapshot) {
                              if (payerSnapshot.connectionState ==
                                  ConnectionState.done) {
                                if (payerSnapshot.hasError) {
                                  return Text('エラー: ${payerSnapshot.error}');
                                }

                                final payerData = payerSnapshot.data;
                                return Text(
                                    '${memberData?.name} → ${payerData?.name}');
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                          trailing: Text(
                            '${tDList[index].amount.toString()}円',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
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
      ),
    );
  }
}
