import '../models/member_data.dart';
import '../models/transaction_data.dart';
import '../models/transaction_detail_data.dart';

class BalanceManager {
  List<MemberData> members;

  BalanceManager({required this.members});

  void updateBalances(TransactionData transaction, List<TransactionDetailData> transactionDetails) {
    // Update the payer's balance
    final payerIndex = members.indexWhere((member) => member.id == transaction.payerId);
    if (payerIndex != -1) {
      members[payerIndex] = members[payerIndex].copyWith(
        balance: members[payerIndex].balance - transaction.amount,
      );
    }

    // Update each payee's balance from the details
    for (final detail in transactionDetails) {
      final payeeIndex = members.indexWhere((member) => member.id == detail.payeeId);
      if (payeeIndex != -1) {
        members[payeeIndex] = members[payeeIndex].copyWith(
          balance: members[payeeIndex].balance + detail.amount,
        );
      }
    }
  }
}

extension MemberDataExtension on MemberData {
  MemberData copyWith({
    int? id,
    int? groupId,
    String? name,
    int? balance,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MemberData(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
