import '../drift/walippe_db.dart';
import '../models/transaction_data.dart';

class TransactionRepository {
  const TransactionRepository({required this.database});
  final WalippeDatabase database;

  Future<List<TransactionData>> fetchTransactions() async {
    final transactions = await database.getAllTransactions();
    return transactions
        .map((transaction) => TransactionData(
              id: transaction.id,
              groupId: transaction.groupId,
              subject: transaction.subject,
              payerId: transaction.payerId,
              amount: transaction.amount,
              createdAt: transaction.createdAt,
              updatedAt: transaction.updatedAt,
            ))
        .toList();
  }

  Future<List<TransactionData>> fetchTransactionsInGroup(int groupId) async {
    final transactions = await database.getTransactionsInGroup(groupId);
    return transactions
        .map((transaction) => TransactionData(
              id: transaction.id,
              groupId: transaction.groupId,
              subject: transaction.subject,
              payerId: transaction.payerId,
              amount: transaction.amount,
              createdAt: transaction.createdAt,
              updatedAt: transaction.updatedAt,
            ))
        .toList();
  }

  Future<int> addTransactionToDatabase(
      int groupId, String subject, int payerId, int amount) async {
    final transactionId = await database.addTransaction(
      groupId,
      subject,
      payerId,
      amount,
    );
    return transactionId;
  }

  Future<void> deleteTransactionById(int id) async {
    await database.deleteTransaction(id);
    await database.deleteTransactionDetail(id);
  }

  Future<void> deleteTransactionByGroupId(int groupId) async {
    await database.deleteTransactions(groupId);
    final transactionIds = await database.getTransactionsInGroup(groupId);
    for (final transactionId in transactionIds) {
      await database.deleteTransactionDetail(transactionId.id);
    }
  }
}
