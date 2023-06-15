import '../drift/walippe_db.dart';
import '../models/transaction_data.dart';

class TransactionRepository {
  const TransactionRepository({required this.database});
  final WalippeDatabase database;

  Future<List<TransactionData>> fetchTransactions() async {
    final transactions = await database.getAllTransactions();
    return transactions.map((transaction) => TransactionData(
      id: transaction.id,
      groupId: transaction.groupId,
      subject: transaction.subject,
      description: transaction.description,
      payerId: transaction.payerId,
      payeeId: transaction.payeeId,
      amount: transaction.amount,
      createdAt: transaction.createdAt,
      updatedAt: transaction.updatedAt,
    )).toList();
  }
}
