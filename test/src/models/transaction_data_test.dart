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
        description: 'Sample transaction',
        payerId: 2,
        payeeId: 3,
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
      expect(transactionData.description, 'Sample transaction');
      expect(transactionData.payerId, 2);
      expect(transactionData.payeeId, 3);
      expect(transactionData.amount, 100);
      expect(transactionData.createdAt, isA<DateTime>());
      expect(transactionData.updatedAt, isA<DateTime>());
    });

    test('should have correct values when updating properties', () {
      final updatedTransactionData = transactionData.copyWith(
        subject: 'Income',
        description: 'Updated transaction',
        amount: 200,
      );

      expect(updatedTransactionData, isA<TransactionData>());
      expect(updatedTransactionData.id, 1);
      expect(updatedTransactionData.groupId, 1);
      expect(updatedTransactionData.subject, 'Income');
      expect(updatedTransactionData.description, 'Updated transaction');
      expect(updatedTransactionData.payerId, 2);
      expect(updatedTransactionData.payeeId, 3);
      expect(updatedTransactionData.amount, 200);
      expect(updatedTransactionData.createdAt, transactionData.createdAt);
      expect(updatedTransactionData.updatedAt, transactionData.updatedAt);
    });
  });
}
