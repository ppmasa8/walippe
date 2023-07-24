import '../drift/walippe_db.dart';
import '../models/transaction_detail_data.dart';

class TransactionDetailRepository {
  const TransactionDetailRepository({required this.database});
  final WalippeDatabase database;

  Future<List<TransactionDetailData>> fetchTransactionDetails() async {
    final transactionDetails = await database.getAllTransactionDetails();
    return transactionDetails
        .map((transactionDetail) => TransactionDetailData(
              id: transactionDetail.id,
              transactionId: transactionDetail.transactionId,
              payeeId: transactionDetail.payeeId,
              amount: transactionDetail.amount,
              createdAt: transactionDetail.createdAt,
              updatedAt: transactionDetail.updatedAt,
            ))
        .toList();
  }

  Future<List<TransactionDetailData>> fetchTransactionDetailsInTransaction(
      int transactionId) async {
    final transactionDetails =
        await database.getTransactionDetailsInTransaction(transactionId);
    return transactionDetails
        .map((transactionDetail) => TransactionDetailData(
              id: transactionDetail.id,
              transactionId: transactionDetail.transactionId,
              payeeId: transactionDetail.payeeId,
              amount: transactionDetail.amount,
              createdAt: transactionDetail.createdAt,
              updatedAt: transactionDetail.updatedAt,
            ))
        .toList();
  }

  Future<void> addTransactionDetailToDatabase(
      int transactionId, int payeeId, int amount) async {
    await database.addTransactionDetail(
      transactionId,
      payeeId,
      amount,
    );
  }

  Future<void> deleteTransactionDetailById(int id) async {
    await database.deleteTransactionDetail(id);
  }

  Future<void> deleteTransactionDetailByTransactionId(int transactionId) async {
    await database.deleteTransactionDetails(transactionId);
  }
}
