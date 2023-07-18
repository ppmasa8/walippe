import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/src/models/transaction_data.dart';
import 'package:walippe/src/repositories/transaction_repository.dart';

import 'walippe_db_test.mocks.dart';

void main() {
  group('TransactionRepository', () {
    test('fetchTransactions returns a list of TransactionData', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = TransactionRepository(database: mockDatabase);

      final dummyTransactionList = [
        Transaction(
          id: 1,
          groupId: 1,
          subject: 'Expense',
          description: 'Sample transaction',
          payerId: 2,
          payeeId: 3,
          amount: 100,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      when(mockDatabase.getAllTransactions())
          .thenAnswer((_) => Future.value(dummyTransactionList));

      final result = await repo.fetchTransactions();

      expect(result, isNotEmpty);
      expect(result.first.id, dummyTransactionList.first.id);
    });

    test('fetchTransactions returns an empty list', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = TransactionRepository(database: mockDatabase);

      when(mockDatabase.getAllTransactions())
          .thenAnswer((_) => Future.value([]));

      final result = await repo.fetchTransactions();

      expect(result, isEmpty);
    });

    test('addTransactionToDatabase adds a transaction', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = TransactionRepository(database: mockDatabase);
      final groupId = 1;
      final subject = 'Expense';
      final description = 'Sample transaction';
      final payerId = 2;
      final payeeId = 3;
      final amount = 100;

      when(mockDatabase.addTransaction(
        groupId,
        subject,
        description,
        payerId,
        payeeId,
        amount
      )).thenAnswer((_) async => 1);

      await repo.addTransactionToDatabase(
        groupId,
        subject,
        description,
        payerId,
        payeeId,
        amount
      );

      verify(mockDatabase.addTransaction(
        groupId,
        subject,
        description,
        payerId,
        payeeId,
        amount
      )).called(1);
    });
  });
}
