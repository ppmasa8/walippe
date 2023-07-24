import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/src/repositories/transaction_repository.dart';

import 'walippe_db_test.mocks.dart';

void main() {
  group('TransactionRepository', () {
    late MockWalippeDatabase mockDatabase;
    late TransactionRepository repo;

    setUp(() {
      mockDatabase = MockWalippeDatabase();
      repo = TransactionRepository(database: mockDatabase);
    });
    test('fetchTransactions returns a list of TransactionData', () async {
      final dummyTransactionList = [
        Transaction(
          id: 1,
          groupId: 1,
          subject: 'Expense',
          payerId: 2,
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
      when(mockDatabase.getAllTransactions())
          .thenAnswer((_) => Future.value([]));

      final result = await repo.fetchTransactions();

      expect(result, isEmpty);
    });

    test('addTransactionToDatabase calls addTransaction', () async {
      const groupId = 1;
      const subject = 'Expense';
      const payerId = 2;
      const amount = 100;
      when(mockDatabase.addTransaction(groupId, subject, payerId, amount))
          .thenAnswer((_) async => 1);

      final transactionId = await repo.addTransactionToDatabase(
          groupId, subject, payerId, amount);

      verify(mockDatabase.addTransaction(groupId, subject, payerId, amount))
          .called(1);
      expect(transactionId, 1);
    });

    test('deleteTransactionById deletes a transaction and its details',
        () async {
      const id = 1;

      when(mockDatabase.deleteTransaction(id)).thenAnswer((_) async => 1);
      when(mockDatabase.deleteTransactionDetail(id))
          .thenAnswer((_) async => 1);

      await repo.deleteTransactionById(id);

      verify(mockDatabase.deleteTransaction(id)).called(1);
      verify(mockDatabase.deleteTransactionDetail(id)).called(1);
    });

    test(
        'deleteTransactionByGroupId deletes transactions and their details in a group',
        () async {
      const groupId = 1;
      final dummyTransactionList = [
        Transaction(
          id: 1,
          groupId: 1,
          subject: 'Expense',
          payerId: 2,
          amount: 100,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Transaction(
          id: 2,
          groupId: 1,
          subject: 'Expense',
          payerId: 4,
          amount: 200,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      when(mockDatabase.deleteTransactions(groupId))
          .thenAnswer((_) async => 1);
      when(mockDatabase.getTransactionsInGroup(groupId))
          .thenAnswer((_) async => dummyTransactionList);
      when(mockDatabase.deleteTransactionDetail(any))
          .thenAnswer((_) async => 1);

      await repo.deleteTransactionByGroupId(groupId);

      verify(mockDatabase.deleteTransactions(groupId)).called(1);
      for (final transaction in dummyTransactionList) {
        verify(mockDatabase.deleteTransactionDetail(transaction.id)).called(1);
      }
    });
  });
}
