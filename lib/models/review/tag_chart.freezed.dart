// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_chart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagChartItemModel _$TagChartItemModelFromJson(Map<String, dynamic> json) {
  return _TagChartItemModel.fromJson(json);
}

/// @nodoc
mixin _$TagChartItemModel {
  int get tagNo => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  int get tagCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagChartItemModelCopyWith<TagChartItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagChartItemModelCopyWith<$Res> {
  factory $TagChartItemModelCopyWith(
          TagChartItemModel value, $Res Function(TagChartItemModel) then) =
      _$TagChartItemModelCopyWithImpl<$Res, TagChartItemModel>;
  @useResult
  $Res call({int tagNo, String value, int tagCnt});
}

/// @nodoc
class _$TagChartItemModelCopyWithImpl<$Res, $Val extends TagChartItemModel>
    implements $TagChartItemModelCopyWith<$Res> {
  _$TagChartItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagNo = null,
    Object? value = null,
    Object? tagCnt = null,
  }) {
    return _then(_value.copyWith(
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      tagCnt: null == tagCnt
          ? _value.tagCnt
          : tagCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TagChartItemModelCopyWith<$Res>
    implements $TagChartItemModelCopyWith<$Res> {
  factory _$$_TagChartItemModelCopyWith(_$_TagChartItemModel value,
          $Res Function(_$_TagChartItemModel) then) =
      __$$_TagChartItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tagNo, String value, int tagCnt});
}

/// @nodoc
class __$$_TagChartItemModelCopyWithImpl<$Res>
    extends _$TagChartItemModelCopyWithImpl<$Res, _$_TagChartItemModel>
    implements _$$_TagChartItemModelCopyWith<$Res> {
  __$$_TagChartItemModelCopyWithImpl(
      _$_TagChartItemModel _value, $Res Function(_$_TagChartItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagNo = null,
    Object? value = null,
    Object? tagCnt = null,
  }) {
    return _then(_$_TagChartItemModel(
      tagNo: null == tagNo
          ? _value.tagNo
          : tagNo // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      tagCnt: null == tagCnt
          ? _value.tagCnt
          : tagCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagChartItemModel
    with DiagnosticableTreeMixin
    implements _TagChartItemModel {
  const _$_TagChartItemModel(
      {required this.tagNo, required this.value, required this.tagCnt});

  factory _$_TagChartItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_TagChartItemModelFromJson(json);

  @override
  final int tagNo;
  @override
  final String value;
  @override
  final int tagCnt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagChartItemModel(tagNo: $tagNo, value: $value, tagCnt: $tagCnt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TagChartItemModel'))
      ..add(DiagnosticsProperty('tagNo', tagNo))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('tagCnt', tagCnt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagChartItemModel &&
            (identical(other.tagNo, tagNo) || other.tagNo == tagNo) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.tagCnt, tagCnt) || other.tagCnt == tagCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tagNo, value, tagCnt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagChartItemModelCopyWith<_$_TagChartItemModel> get copyWith =>
      __$$_TagChartItemModelCopyWithImpl<_$_TagChartItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagChartItemModelToJson(
      this,
    );
  }
}

abstract class _TagChartItemModel implements TagChartItemModel {
  const factory _TagChartItemModel(
      {required final int tagNo,
      required final String value,
      required final int tagCnt}) = _$_TagChartItemModel;

  factory _TagChartItemModel.fromJson(Map<String, dynamic> json) =
      _$_TagChartItemModel.fromJson;

  @override
  int get tagNo;
  @override
  String get value;
  @override
  int get tagCnt;
  @override
  @JsonKey(ignore: true)
  _$$_TagChartItemModelCopyWith<_$_TagChartItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TagChartModel _$TagChartModelFromJson(Map<String, dynamic> json) {
  return _TagChartModel.fromJson(json);
}

/// @nodoc
mixin _$TagChartModel {
  int get totalCnt => throw _privateConstructorUsedError;
  List<TagChartItemModel> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagChartModelCopyWith<TagChartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagChartModelCopyWith<$Res> {
  factory $TagChartModelCopyWith(
          TagChartModel value, $Res Function(TagChartModel) then) =
      _$TagChartModelCopyWithImpl<$Res, TagChartModel>;
  @useResult
  $Res call({int totalCnt, List<TagChartItemModel> tags});
}

/// @nodoc
class _$TagChartModelCopyWithImpl<$Res, $Val extends TagChartModel>
    implements $TagChartModelCopyWith<$Res> {
  _$TagChartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCnt = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      totalCnt: null == totalCnt
          ? _value.totalCnt
          : totalCnt // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagChartItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TagChartModelCopyWith<$Res>
    implements $TagChartModelCopyWith<$Res> {
  factory _$$_TagChartModelCopyWith(
          _$_TagChartModel value, $Res Function(_$_TagChartModel) then) =
      __$$_TagChartModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalCnt, List<TagChartItemModel> tags});
}

/// @nodoc
class __$$_TagChartModelCopyWithImpl<$Res>
    extends _$TagChartModelCopyWithImpl<$Res, _$_TagChartModel>
    implements _$$_TagChartModelCopyWith<$Res> {
  __$$_TagChartModelCopyWithImpl(
      _$_TagChartModel _value, $Res Function(_$_TagChartModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCnt = null,
    Object? tags = null,
  }) {
    return _then(_$_TagChartModel(
      totalCnt: null == totalCnt
          ? _value.totalCnt
          : totalCnt // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagChartItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagChartModel with DiagnosticableTreeMixin implements _TagChartModel {
  const _$_TagChartModel(
      {required this.totalCnt, required final List<TagChartItemModel> tags})
      : _tags = tags;

  factory _$_TagChartModel.fromJson(Map<String, dynamic> json) =>
      _$$_TagChartModelFromJson(json);

  @override
  final int totalCnt;
  final List<TagChartItemModel> _tags;
  @override
  List<TagChartItemModel> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagChartModel(totalCnt: $totalCnt, tags: $tags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TagChartModel'))
      ..add(DiagnosticsProperty('totalCnt', totalCnt))
      ..add(DiagnosticsProperty('tags', tags));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagChartModel &&
            (identical(other.totalCnt, totalCnt) ||
                other.totalCnt == totalCnt) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCnt, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagChartModelCopyWith<_$_TagChartModel> get copyWith =>
      __$$_TagChartModelCopyWithImpl<_$_TagChartModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagChartModelToJson(
      this,
    );
  }
}

abstract class _TagChartModel implements TagChartModel {
  const factory _TagChartModel(
      {required final int totalCnt,
      required final List<TagChartItemModel> tags}) = _$_TagChartModel;

  factory _TagChartModel.fromJson(Map<String, dynamic> json) =
      _$_TagChartModel.fromJson;

  @override
  int get totalCnt;
  @override
  List<TagChartItemModel> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_TagChartModelCopyWith<_$_TagChartModel> get copyWith =>
      throw _privateConstructorUsedError;
}
