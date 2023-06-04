import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_data.freezed.dart';

@freezed
class MemberData with _$MemberData {
  const factory MemberData({
    required int id,
    required int groupId,
    required String name,
    required String? description,
    required int balance,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MemberData;
}