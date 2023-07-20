import 'package:flutter_test/flutter_test.dart';
import 'package:walippe/src/models/transaction_detail_data.dart';

void main() {
  group('TransactionDetailData', () {
    late TransactionDetailData transactionDetailData;

    setUp(() {
      transactionDetailData = TransactionDetailData(
        id: 1,
        transactionId: 1,
        payeeId: 2,
        amount: 1000,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    });

    test('should create a valid TransactionDetailData instance', () {
      expect(transactionDetailData, isA<TransactionDetailData>());
      expect(transactionDetailData.id, 1);
      expect(transactionDetailData.transactionId, 1);
      expect(transactionDetailData.payeeId, 2);
      expect(transactionDetailData.amount, 1000);
      expect(transactionDetailData.createdAt, isA<DateTime>());
      expect(transactionDetailData.updatedAt, isA<DateTime>());
    });

    test('should have correct values when updating properties', () {
      final updatedTransactionDetailData = transactionDetailData.copyWith(
        payeeId: 3,
        amount: 1500,
      );

      expect(updatedTransactionDetailData, isA<TransactionDetailData>());
      expect(updatedTransactionDetailData.id, 1);
      expect(updatedTransactionDetailData.transactionId, 1);
      expect(updatedTransactionDetailData.payeeId, 3);
      expect(updatedTransactionDetailData.amount, 1500);
      expect(updatedTransactionDetailData.createdAt, transactionDetailData.createdAt);
      expect(updatedTransactionDetailData.updatedAt, transactionDetailData.updatedAt);
    });
  });
}
