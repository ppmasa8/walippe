// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionData {
  int get id => throw _privateConstructorUsedError;
  int get groupId => throw _privateConstructorUsedError;
  int get payerId => throw _privateConstructorUsedError;
  int get payeeId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionDataCopyWith<TransactionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDataCopyWith<$Res> {
  factory $TransactionDataCopyWith(
          TransactionData value, $Res Function(TransactionData) then) =
      _$TransactionDataCopyWithImpl<$Res, TransactionData>;
  @useResult
  $Res call(
      {int id,
      int groupId,
      int payerId,
      int payeeId,
      int amount,
      String description,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$TransactionDataCopyWithImpl<$Res, $Val extends TransactionData>
    implements $TransactionDataCopyWith<$Res> {
  _$TransactionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? payerId = null,
    Object? payeeId = null,
    Object? amount = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      payerId: null == payerId
          ? _value.payerId
          : payerId // ignore: cast_nullable_to_non_nullable
              as int,
      payeeId: null == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionDataCopyWith<$Res>
    implements $TransactionDataCopyWith<$Res> {
  factory _$$_TransactionDataCopyWith(
          _$_TransactionData value, $Res Function(_$_TransactionData) then) =
      __$$_TransactionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int groupId,
      int payerId,
      int payeeId,
      int amount,
      String description,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_TransactionDataCopyWithImpl<$Res>
    extends _$TransactionDataCopyWithImpl<$Res, _$_TransactionData>
    implements _$$_TransactionDataCopyWith<$Res> {
  __$$_TransactionDataCopyWithImpl(
      _$_TransactionData _value, $Res Function(_$_TransactionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? payerId = null,
    Object? payeeId = null,
    Object? amount = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_TransactionData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      payerId: null == payerId
          ? _value.payerId
          : payerId // ignore: cast_nullable_to_non_nullable
              as int,
      payeeId: null == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_TransactionData implements _TransactionData {
  const _$_TransactionData(
      {required this.id,
      required this.groupId,
      required this.payerId,
      required this.payeeId,
      required this.amount,
      required this.description,
      required this.createdAt,
      required this.updatedAt});

  @override
  final int id;
  @override
  final int groupId;
  @override
  final int payerId;
  @override
  final int payeeId;
  @override
  final int amount;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TransactionData(id: $id, groupId: $groupId, payerId: $payerId, payeeId: $payeeId, amount: $amount, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.payerId, payerId) || other.payerId == payerId) &&
            (identical(other.payeeId, payeeId) || other.payeeId == payeeId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, groupId, payerId, payeeId,
      amount, description, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionDataCopyWith<_$_TransactionData> get copyWith =>
      __$$_TransactionDataCopyWithImpl<_$_TransactionData>(this, _$identity);
}

abstract class _TransactionData implements TransactionData {
  const factory _TransactionData(
      {required final int id,
      required final int groupId,
      required final int payerId,
      required final int payeeId,
      required final int amount,
      required final String description,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_TransactionData;

  @override
  int get id;
  @override
  int get groupId;
  @override
  int get payerId;
  @override
  int get payeeId;
  @override
  int get amount;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionDataCopyWith<_$_TransactionData> get copyWith =>
      throw _privateConstructorUsedError;
}
