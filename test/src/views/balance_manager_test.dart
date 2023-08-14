import 'package:flutter_test/flutter_test.dart';
import 'package:walippe/src/models/member_data.dart';
import 'package:walippe/src/models/transaction_data.dart';
import 'package:walippe/src/models/transaction_detail_data.dart';
import 'package:walippe/src/views/balance_manager.dart';

void main() {
  group('BalanceManager', () {
    test('updateBalances method should correctly update member balances', () {
      // Given: Prepare some initial data
      final members = [
        MemberData(
            id: 1, groupId: 1, name: "Alice", balance: 1000, createdAt: DateTime.now(), updatedAt: DateTime.now()),
        MemberData(
            id: 2, groupId: 1, name: "Bob", balance: 1000, createdAt: DateTime.now(), updatedAt: DateTime.now()),
      ];
      final transaction = TransactionData(
          id: 1,
          groupId: 1,
          subject: "Dinner",
          payerId: 1,
          amount: 500,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      final transactionDetails = [
        TransactionDetailData(
            id: 1,
            transactionId: 1,
            payeeId: 2,
            amount: 500,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now())
      ];

      final manager = BalanceManager(members: members);

      // When: Calling the method under test
      manager.updateBalances(transaction, transactionDetails);

      // Then: The balances should be updated correctly
      expect(manager.members[0].balance, 500); // Alice's balance should decrease by 500
      expect(manager.members[1].balance, 1500); // Bob's balance should increase by 500
    });
  });
}
