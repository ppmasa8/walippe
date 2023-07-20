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

  Future<void> addTransactionToDatabase(
      int groupId, String subject, int payerId, int amount) async {
    await database.addTransaction(
      groupId,
      subject,
      payerId,
      amount,
    );
  }
}
