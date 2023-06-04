import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_data.freezed.dart';

@freezed
class TransactionData with _$TransactionData {
  const factory TransactionData({
    required int id,
    required int groupId,
    required int payerId,
    required int payeeId,
    required int amount,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionData;
}