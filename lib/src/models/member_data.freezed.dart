// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MemberData {
  int get id => throw _privateConstructorUsedError;
  int get groupId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemberDataCopyWith<MemberData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberDataCopyWith<$Res> {
  factory $MemberDataCopyWith(
          MemberData value, $Res Function(MemberData) then) =
      _$MemberDataCopyWithImpl<$Res, MemberData>;
  @useResult
  $Res call(
      {int id,
      int groupId,
      String name,
      String description,
      int balance,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$MemberDataCopyWithImpl<$Res, $Val extends MemberData>
    implements $MemberDataCopyWith<$Res> {
  _$MemberDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? name = null,
    Object? description = null,
    Object? balance = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_MemberDataCopyWith<$Res>
    implements $MemberDataCopyWith<$Res> {
  factory _$$_MemberDataCopyWith(
          _$_MemberData value, $Res Function(_$_MemberData) then) =
      __$$_MemberDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int groupId,
      String name,
      String description,
      int balance,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_MemberDataCopyWithImpl<$Res>
    extends _$MemberDataCopyWithImpl<$Res, _$_MemberData>
    implements _$$_MemberDataCopyWith<$Res> {
  __$$_MemberDataCopyWithImpl(
      _$_MemberData _value, $Res Function(_$_MemberData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? name = null,
    Object? description = null,
    Object? balance = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_MemberData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
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

class _$_MemberData implements _MemberData {
  const _$_MemberData(
      {required this.id,
      required this.groupId,
      required this.name,
      required this.description,
      required this.balance,
      required this.createdAt,
      required this.updatedAt});

  @override
  final int id;
  @override
  final int groupId;
  @override
  final String name;
  @override
  final String description;
  @override
  final int balance;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MemberData(id: $id, groupId: $groupId, name: $name, description: $description, balance: $balance, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, groupId, name, description,
      balance, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberDataCopyWith<_$_MemberData> get copyWith =>
      __$$_MemberDataCopyWithImpl<_$_MemberData>(this, _$identity);
}

abstract class _MemberData implements MemberData {
  const factory _MemberData(
      {required final int id,
      required final int groupId,
      required final String name,
      required final String description,
      required final int balance,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_MemberData;

  @override
  int get id;
  @override
  int get groupId;
  @override
  String get name;
  @override
  String get description;
  @override
  int get balance;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_MemberDataCopyWith<_$_MemberData> get copyWith =>
      throw _privateConstructorUsedError;
}
