import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walippe/src/views/screens/show_result_screen.dart';

import '../../const/const.dart';
import '../../providers/provider.dart';
import 'create_transaction_screen.dart';
import '../../models/group_data.dart';
import '../../views/screens/edit_group_screen.dart';
import 'show_transaction_screen.dart';

class ShowGroupScreen extends ConsumerWidget {
  const ShowGroupScreen({super.key, required this.groupData});

  final GroupData groupData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberListInGroupAsync =
        ref.watch(memberListInGroupProvider(groupData.id));
    final transactionListInGroupAsync =
        ref.watch(transactionListInGroupProvider(groupData.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          groupData.name,
          style: GoogleFonts.sawarabiGothic(
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditGroupScreen(
                      key: ValueKey(groupData.id),
                      groupData: groupData,
                    ),
                  ),
                );
              },
              child: const Text(editGroupText),
            ),
          ),
          const Text(memberLabelText),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: memberListInGroupAsync.when(
              data: (members) {
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: members.map((member) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(member.name),
                    );
                  }).toList(),
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
              error: (error, stackTrace) {
                return Text('Error: $error');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                
                Navigator.of(context).push<void>(
                  MaterialPageRoute(
                    builder: (context) =>
                        ProviderScope(child: ShowResultScreen(
                          key: ValueKey(groupData.id),
                          groupData: groupData,
                        )),
                  ),
                );
              },
              child: const Text(showResult),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateTransactionScreen(
                              key: ValueKey(groupData.id),
                              groupData: groupData,
                            )));
              },
              child: const Text(addTransactionRecordText),
            ),
          ),
          const Text(transactionRecordLabelText),
          Expanded(
            child: transactionListInGroupAsync.when(
              data: (transactions) {
                return ListView.separated(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        margin: const EdgeInsets.only(left: 16.0),
                        child: Text(transactions[index].subject),
                      ),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await ref
                                .watch(transactionRepositoryProvider)
                                .deleteTransactionById(transactions[index].id);
                            return ref.refresh(
                                transactionListInGroupProvider(groupData.id));
                          },
                        ),
                      ]),
                      onTap: () async {
                        Navigator.of(context).push<void>(
                          MaterialPageRoute(
                            builder: (context) => ProviderScope(
                                child: ShowTransactionScreen(
                              key: ValueKey(transactions[index].id),
                              transactionData: transactions[index],
                            )),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 0.5,
                    );
                  },
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
              error: (error, stackTrace) {
                return Text('Error: $error');
              },
            ),
          ),
        ],
      )),
    );
  }
}
