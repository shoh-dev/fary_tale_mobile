// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  TaleListState get taleListState => throw _privateConstructorUsedError;
  ApplicationState get applicationState => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({TaleListState taleListState, ApplicationState applicationState});

  $TaleListStateCopyWith<$Res> get taleListState;
  $ApplicationStateCopyWith<$Res> get applicationState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taleListState = null,
    Object? applicationState = null,
  }) {
    return _then(_value.copyWith(
      taleListState: null == taleListState
          ? _value.taleListState
          : taleListState // ignore: cast_nullable_to_non_nullable
              as TaleListState,
      applicationState: null == applicationState
          ? _value.applicationState
          : applicationState // ignore: cast_nullable_to_non_nullable
              as ApplicationState,
    ) as $Val);
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaleListStateCopyWith<$Res> get taleListState {
    return $TaleListStateCopyWith<$Res>(_value.taleListState, (value) {
      return _then(_value.copyWith(taleListState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplicationStateCopyWith<$Res> get applicationState {
    return $ApplicationStateCopyWith<$Res>(_value.applicationState, (value) {
      return _then(_value.copyWith(applicationState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TaleListState taleListState, ApplicationState applicationState});

  @override
  $TaleListStateCopyWith<$Res> get taleListState;
  @override
  $ApplicationStateCopyWith<$Res> get applicationState;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taleListState = null,
    Object? applicationState = null,
  }) {
    return _then(_$AppStateImpl(
      taleListState: null == taleListState
          ? _value.taleListState
          : taleListState // ignore: cast_nullable_to_non_nullable
              as TaleListState,
      applicationState: null == applicationState
          ? _value.applicationState
          : applicationState // ignore: cast_nullable_to_non_nullable
              as ApplicationState,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {required this.taleListState, required this.applicationState});

  @override
  final TaleListState taleListState;
  @override
  final ApplicationState applicationState;

  @override
  String toString() {
    return 'AppState(taleListState: $taleListState, applicationState: $applicationState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.taleListState, taleListState) ||
                other.taleListState == taleListState) &&
            (identical(other.applicationState, applicationState) ||
                other.applicationState == applicationState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taleListState, applicationState);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required final TaleListState taleListState,
      required final ApplicationState applicationState}) = _$AppStateImpl;

  @override
  TaleListState get taleListState;
  @override
  ApplicationState get applicationState;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
