// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_detail_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionDetailData {
  int get id => throw _privateConstructorUsedError;
  int get transactionId => throw _privateConstructorUsedError;
  int get payeeId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionDetailDataCopyWith<TransactionDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailDataCopyWith<$Res> {
  factory $TransactionDetailDataCopyWith(TransactionDetailData value,
          $Res Function(TransactionDetailData) then) =
      _$TransactionDetailDataCopyWithImpl<$Res, TransactionDetailData>;
  @useResult
  $Res call(
      {int id,
      int transactionId,
      int payeeId,
      int amount,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$TransactionDetailDataCopyWithImpl<$Res,
        $Val extends TransactionDetailData>
    implements $TransactionDetailDataCopyWith<$Res> {
  _$TransactionDetailDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionId = null,
    Object? payeeId = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      payeeId: null == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_TransactionDetailDataCopyWith<$Res>
    implements $TransactionDetailDataCopyWith<$Res> {
  factory _$$_TransactionDetailDataCopyWith(_$_TransactionDetailData value,
          $Res Function(_$_TransactionDetailData) then) =
      __$$_TransactionDetailDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int transactionId,
      int payeeId,
      int amount,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_TransactionDetailDataCopyWithImpl<$Res>
    extends _$TransactionDetailDataCopyWithImpl<$Res, _$_TransactionDetailData>
    implements _$$_TransactionDetailDataCopyWith<$Res> {
  __$$_TransactionDetailDataCopyWithImpl(_$_TransactionDetailData _value,
      $Res Function(_$_TransactionDetailData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionId = null,
    Object? payeeId = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_TransactionDetailData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      payeeId: null == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$_TransactionDetailData implements _TransactionDetailData {
  const _$_TransactionDetailData(
      {required this.id,
      required this.transactionId,
      required this.payeeId,
      required this.amount,
      required this.createdAt,
      required this.updatedAt});

  @override
  final int id;
  @override
  final int transactionId;
  @override
  final int payeeId;
  @override
  final int amount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TransactionDetailData(id: $id, transactionId: $transactionId, payeeId: $payeeId, amount: $amount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionDetailData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.payeeId, payeeId) || other.payeeId == payeeId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, transactionId, payeeId, amount, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionDetailDataCopyWith<_$_TransactionDetailData> get copyWith =>
      __$$_TransactionDetailDataCopyWithImpl<_$_TransactionDetailData>(
          this, _$identity);
}

abstract class _TransactionDetailData implements TransactionDetailData {
  const factory _TransactionDetailData(
      {required final int id,
      required final int transactionId,
      required final int payeeId,
      required final int amount,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_TransactionDetailData;

  @override
  int get id;
  @override
  int get transactionId;
  @override
  int get payeeId;
  @override
  int get amount;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionDetailDataCopyWith<_$_TransactionDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}
