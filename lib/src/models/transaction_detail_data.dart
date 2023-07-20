import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_detail_data.freezed.dart';

@freezed
class TransactionDetailData with _$TransactionDetailData {
  const factory TransactionDetailData({
    required int id,
    required int transactionId,
    required int payeeId,
    required int amount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionDetailData;
}