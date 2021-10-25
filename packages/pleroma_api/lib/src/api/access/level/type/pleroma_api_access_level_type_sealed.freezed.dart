// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_level_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PleromaApiAccessLevelTypeTearOff {
  const _$PleromaApiAccessLevelTypeTearOff();

  _Public public(
      {int level = PleromaApiAccessLevelType.publicLevelIntValue,
      String stringValue = PleromaApiAccessLevelType.publicLevelStringValue}) {
    return _Public(
      level: level,
      stringValue: stringValue,
    );
  }

  _Application application(
      {int level = PleromaApiAccessLevelType.applicationLevelIntValue,
      String stringValue =
          PleromaApiAccessLevelType.applicationLevelStringValue}) {
    return _Application(
      level: level,
      stringValue: stringValue,
    );
  }

  _Valid user(
      {int level = PleromaApiAccessLevelType.userLevelIntValue,
      String stringValue = PleromaApiAccessLevelType.userLevelStringValue}) {
    return _Valid(
      level: level,
      stringValue: stringValue,
    );
  }
}

/// @nodoc
const $PleromaApiAccessLevelType = _$PleromaApiAccessLevelTypeTearOff();

/// @nodoc
mixin _$PleromaApiAccessLevelType {
  int get level => throw _privateConstructorUsedError;
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int level, String stringValue) public,
    required TResult Function(int level, String stringValue) application,
    required TResult Function(int level, String stringValue) user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int level, String stringValue)? public,
    TResult Function(int level, String stringValue)? application,
    TResult Function(int level, String stringValue)? user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int level, String stringValue)? public,
    TResult Function(int level, String stringValue)? application,
    TResult Function(int level, String stringValue)? user,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Public value) public,
    required TResult Function(_Application value) application,
    required TResult Function(_Valid value) user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Application value)? application,
    TResult Function(_Valid value)? user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Application value)? application,
    TResult Function(_Valid value)? user,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PleromaApiAccessLevelTypeCopyWith<PleromaApiAccessLevelType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessLevelTypeCopyWith<$Res> {
  factory $PleromaApiAccessLevelTypeCopyWith(PleromaApiAccessLevelType value,
          $Res Function(PleromaApiAccessLevelType) then) =
      _$PleromaApiAccessLevelTypeCopyWithImpl<$Res>;
  $Res call({int level, String stringValue});
}

/// @nodoc
class _$PleromaApiAccessLevelTypeCopyWithImpl<$Res>
    implements $PleromaApiAccessLevelTypeCopyWith<$Res> {
  _$PleromaApiAccessLevelTypeCopyWithImpl(this._value, this._then);

  final PleromaApiAccessLevelType _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccessLevelType) _then;

  @override
  $Res call({
    Object? level = freezed,
    Object? stringValue = freezed,
  }) {
    return _then(_value.copyWith(
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PublicCopyWith<$Res>
    implements $PleromaApiAccessLevelTypeCopyWith<$Res> {
  factory _$PublicCopyWith(_Public value, $Res Function(_Public) then) =
      __$PublicCopyWithImpl<$Res>;
  @override
  $Res call({int level, String stringValue});
}

/// @nodoc
class __$PublicCopyWithImpl<$Res>
    extends _$PleromaApiAccessLevelTypeCopyWithImpl<$Res>
    implements _$PublicCopyWith<$Res> {
  __$PublicCopyWithImpl(_Public _value, $Res Function(_Public) _then)
      : super(_value, (v) => _then(v as _Public));

  @override
  _Public get _value => super._value as _Public;

  @override
  $Res call({
    Object? level = freezed,
    Object? stringValue = freezed,
  }) {
    return _then(_Public(
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Public implements _Public {
  const _$_Public(
      {this.level = PleromaApiAccessLevelType.publicLevelIntValue,
      this.stringValue = PleromaApiAccessLevelType.publicLevelStringValue});

  @JsonKey(defaultValue: PleromaApiAccessLevelType.publicLevelIntValue)
  @override
  final int level;
  @JsonKey(defaultValue: PleromaApiAccessLevelType.publicLevelStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiAccessLevelType.public(level: $level, stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Public &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$PublicCopyWith<_Public> get copyWith =>
      __$PublicCopyWithImpl<_Public>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int level, String stringValue) public,
    required TResult Function(int level, String stringValue) application,
    required TResult Function(int level, String stringValue) user,
  }) {
    return public(level, stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int level, String stringValue)? public,
    TResult Function(int level, String stringValue)? application,
    TResult Function(int level, String stringValue)? user,
  }) {
    return public?.call(level, stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int level, String stringValue)? public,
    TResult Function(int level, String stringValue)? application,
    TResult Function(int level, String stringValue)? user,
    required TResult orElse(),
  }) {
    if (public != null) {
      return public(level, stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Public value) public,
    required TResult Function(_Application value) application,
    required TResult Function(_Valid value) user,
  }) {
    return public(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Application value)? application,
    TResult Function(_Valid value)? user,
  }) {
    return public?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Application value)? application,
    TResult Function(_Valid value)? user,
    required TResult orElse(),
  }) {
    if (public != null) {
      return public(this);
    }
    return orElse();
  }
}

abstract class _Public implements PleromaApiAccessLevelType {
  const factory _Public({int level, String stringValue}) = _$_Public;

  @override
  int get level => throw _privateConstructorUsedError;
  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PublicCopyWith<_Public> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ApplicationCopyWith<$Res>
    implements $PleromaApiAccessLevelTypeCopyWith<$Res> {
  factory _$ApplicationCopyWith(
          _Application value, $Res Function(_Application) then) =
      __$ApplicationCopyWithImpl<$Res>;
  @override
  $Res call({int level, String stringValue});
}

/// @nodoc
class __$ApplicationCopyWithImpl<$Res>
    extends _$PleromaApiAccessLevelTypeCopyWithImpl<$Res>
    implements _$ApplicationCopyWith<$Res> {
  __$ApplicationCopyWithImpl(
      _Application _value, $Res Function(_Application) _then)
      : super(_value, (v) => _then(v as _Application));

  @override
  _Application get _value => super._value as _Application;

  @override
  $Res call({
    Object? level = freezed,
    Object? stringValue = freezed,
  }) {
    return _then(_Application(
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Application implements _Application {
  const _$_Application(
      {this.level = PleromaApiAccessLevelType.applicationLevelIntValue,
      this.stringValue =
          PleromaApiAccessLevelType.applicationLevelStringValue});

  @JsonKey(defaultValue: PleromaApiAccessLevelType.applicationLevelIntValue)
  @override
  final int level;
  @JsonKey(defaultValue: PleromaApiAccessLevelType.applicationLevelStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiAccessLevelType.application(level: $level, stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Application &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$ApplicationCopyWith<_Application> get copyWith =>
      __$ApplicationCopyWithImpl<_Application>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int level, String stringValue) public,
    required TResult Function(int level, String stringValue) application,
    required TResult Function(int level, String stringValue) user,
  }) {
    return application(level, stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int level, String stringValue)? public,
    TResult Function(int level, String stringValue)? application,
    TResult Function(int level, String stringValue)? user,
  }) {
    return application?.call(level, stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int level, String stringValue)? public,
    TResult Function(int level, String stringValue)? application,
    TResult Function(int level, String stringValue)? user,
    required TResult orElse(),
  }) {
    if (application != null) {
      return application(level, stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Public value) public,
    required TResult Function(_Application value) application,
    required TResult Function(_Valid value) user,
  }) {
    return application(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Application value)? application,
    TResult Function(_Valid value)? user,
  }) {
    return application?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Application value)? application,
    TResult Function(_Valid value)? user,
    required TResult orElse(),
  }) {
    if (application != null) {
      return application(this);
    }
    return orElse();
  }
}

abstract class _Application implements PleromaApiAccessLevelType {
  const factory _Application({int level, String stringValue}) = _$_Application;

  @override
  int get level => throw _privateConstructorUsedError;
  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApplicationCopyWith<_Application> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ValidCopyWith<$Res>
    implements $PleromaApiAccessLevelTypeCopyWith<$Res> {
  factory _$ValidCopyWith(_Valid value, $Res Function(_Valid) then) =
      __$ValidCopyWithImpl<$Res>;
  @override
  $Res call({int level, String stringValue});
}

/// @nodoc
class __$ValidCopyWithImpl<$Res>
    extends _$PleromaApiAccessLevelTypeCopyWithImpl<$Res>
    implements _$ValidCopyWith<$Res> {
  __$ValidCopyWithImpl(_Valid _value, $Res Function(_Valid) _then)
      : super(_value, (v) => _then(v as _Valid));

  @override
  _Valid get _value => super._value as _Valid;

  @override
  $Res call({
    Object? level = freezed,
    Object? stringValue = freezed,
  }) {
    return _then(_Valid(
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Valid implements _Valid {
  const _$_Valid(
      {this.level = PleromaApiAccessLevelType.userLevelIntValue,
      this.stringValue = PleromaApiAccessLevelType.userLevelStringValue});

  @JsonKey(defaultValue: PleromaApiAccessLevelType.userLevelIntValue)
  @override
  final int level;
  @JsonKey(defaultValue: PleromaApiAccessLevelType.userLevelStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiAccessLevelType.user(level: $level, stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Valid &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$ValidCopyWith<_Valid> get copyWith =>
      __$ValidCopyWithImpl<_Valid>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int level, String stringValue) public,
    required TResult Function(int level, String stringValue) application,
    required TResult Function(int level, String stringValue) user,
  }) {
    return user(level, stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int level, String stringValue)? public,
    TResult Function(int level, String stringValue)? application,
    TResult Function(int level, String stringValue)? user,
  }) {
    return user?.call(level, stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int level, String stringValue)? public,
    TResult Function(int level, String stringValue)? application,
    TResult Function(int level, String stringValue)? user,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(level, stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Public value) public,
    required TResult Function(_Application value) application,
    required TResult Function(_Valid value) user,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Application value)? application,
    TResult Function(_Valid value)? user,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Application value)? application,
    TResult Function(_Valid value)? user,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }
}

abstract class _Valid implements PleromaApiAccessLevelType {
  const factory _Valid({int level, String stringValue}) = _$_Valid;

  @override
  int get level => throw _privateConstructorUsedError;
  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ValidCopyWith<_Valid> get copyWith => throw _privateConstructorUsedError;
}
