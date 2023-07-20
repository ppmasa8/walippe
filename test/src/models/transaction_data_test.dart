import 'package:flutter_test/flutter_test.dart';
import 'package:walippe/src/models/transaction_data.dart';

void main() {
  group('TransactionData', () {
    late TransactionData transactionData;

    setUp(() {
      transactionData = TransactionData(
        id: 1,
        groupId: 1,
        subject: 'Expense',
        payerId: 2,
        amount: 100,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    });

    test('should create a valid TransactionData instance', () {
      expect(transactionData, isA<TransactionData>());
      expect(transactionData.id, 1);
      expect(transactionData.groupId, 1);
      expect(transactionData.subject, 'Expense');
      expect(transactionData.payerId, 2);
      expect(transactionData.amount, 100);
      expect(transactionData.createdAt, isA<DateTime>());
      expect(transactionData.updatedAt, isA<DateTime>());
    });

    test('should have correct values when updating properties', () {
      final updatedTransactionData = transactionData.copyWith(
        subject: 'Income',
        amount: 200,
      );

      expect(updatedTransactionData, isA<TransactionData>());
      expect(updatedTransactionData.id, 1);
      expect(updatedTransactionData.groupId, 1);
      expect(updatedTransactionData.subject, 'Income');
      expect(updatedTransactionData.payerId, 2);
      expect(updatedTransactionData.amount, 200);
      expect(updatedTransactionData.createdAt, transactionData.createdAt);
      expect(updatedTransactionData.updatedAt, transactionData.updatedAt);
    });
  });
}
