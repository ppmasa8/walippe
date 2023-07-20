import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_data.freezed.dart';

@freezed
class GroupData with _$GroupData {
  const factory GroupData({
    required int id,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _GroupData;
}
