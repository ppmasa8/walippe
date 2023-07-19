import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walippe/src/views/divide_amount.dart';

import '../../const/const.dart';
import '../../models/group_data.dart';
import '../../models/member_data.dart';
import '../../models/transaction_data.dart';
import '../../providers/provider.dart';

class CreateTransactionScreen extends ConsumerStatefulWidget {
  const CreateTransactionScreen({Key? key, required this.groupData})
      : super(key: key);

  final GroupData groupData;

  @override
  _CreateTransactionScreenState createState() =>
      _CreateTransactionScreenState();
}

class _CreateTransactionScreenState
    extends ConsumerState<CreateTransactionScreen> {
  MemberData payer = MemberData(
    id: 0,
    groupId: 0,
    name: '',
    description: null,
    balance: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  Map<MemberData, bool> payeeSelections = {};

  String subject = '';

  int amount = 0;

  var divider = DivideAmount();

  @override
  Widget build(BuildContext context) {
    final formValidator = ref.watch(formValidatorProvider);
    final memberListInGroup =
        ref.watch(memberListInGroupProvider(widget.groupData.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.groupData.name,
          style: GoogleFonts.dancingScript(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: memberListInGroup.when(
            data: (members) {
              if (!members.map((member) => member.name).contains(payer.name)) {
                payer = members[0];
              }

              if (payeeSelections.isEmpty) {
                members.forEach((member) {
                  payeeSelections[member] = false;
                });
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<MemberData>(
                    items: members.map((member) {
                      return DropdownMenuItem<MemberData>(
                        value: member,
                        child: Text(member.name),
                      );
                    }).toList(),
                    value: payer,
                    onChanged: (value) {
                      setState(() {
                        payer = value!;
                      });
                    },
                  ),
                  const Text("が"),
                  ...members.map((member) {
                    return CheckboxListTile(
                      title: Text(member.name),
                      value: payeeSelections[member],
                      onChanged: (value) {
                        setState(() {
                          payeeSelections[member] = value!;
                        });
                      },
                    );
                  }).toList(),
                  const Text("の"),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '飛行機代',
                      ),
                      validator: formValidator.validateSubject,
                      onChanged: (value) {
                        setState(() {
                          subject = value;
                        });
                      },
                    ),
                  ),
                  const Text("を払って、"),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '￥',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        setState(() {
                          amount = int.parse(value);
                        });
                      },
                    ),
                  ),
                  const Text("かかった。"),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      final payeeList = payeeSelections.entries
                          .where((entry) => entry.value)
                          .map((entry) => entry.key)
                          .toList();
                      final perPersonAmount = divider.calculateAmountPerPerson(
                          amount, payeeList.length);
                      for (var payee in payeeList) {
                        await ref
                            .watch(transactionRepositoryProvider)
                            .addTransactionToDatabase(
                              widget.groupData.id,
                              subject,
                              'test',
                              payer.id,
                              payee.id,
                              perPersonAmount,
                            );
                      }
                      Navigator.pop(context);
                    },
                    child: const Text(entry),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text(backPage),
                  ),
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
