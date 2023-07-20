import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:walippe/src/drift/walippe_db.dart';
import 'package:walippe/src/repositories/transaction_detail_repository.dart';

import 'walippe_db_test.mocks.dart';

void main() {
  group('TransactionDetailRepository', () {
    test('fetchTransactionDetails returns a list of TransactionDetailData', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = TransactionDetailRepository(database: mockDatabase);

      final dummyTransactionDetailList = [
        TransactionDetail(
          id: 1,
          transactionId: 1,
          payeeId: 2,
          amount: 1000,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      when(mockDatabase.getAllTransactionDetails())
          .thenAnswer((_) => Future.value(dummyTransactionDetailList));

      final result = await repo.fetchTransactionDetails();

      expect(result, isNotEmpty);
      expect(result.first.id, dummyTransactionDetailList.first.id);
    });

    test('fetchTransactionDetails returns an empty list', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = TransactionDetailRepository(database: mockDatabase);

      when(mockDatabase.getAllTransactionDetails())
          .thenAnswer((_) => Future.value([]));

      final result = await repo.fetchTransactionDetails();

      expect(result, isEmpty);
    });

    test('addTransactionDetailToDatabase adds a transaction detail', () async {
      final mockDatabase = MockWalippeDatabase();
      final repo = TransactionDetailRepository(database: mockDatabase);
      final transactionId = 1;
      final payeeId = 2;
      final amount = 1000;

      when(mockDatabase.addTransactionDetail(
        transactionId,
        payeeId,
        amount
      )).thenAnswer((_) async => 1);

      await repo.addTransactionDetailToDatabase(
        transactionId,
        payeeId,
        amount
      );

      verify(mockDatabase.addTransactionDetail(
        transactionId,
        payeeId,
        amount
      )).called(1);
    });
  });
}
