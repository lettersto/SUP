// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewForm {
  int get storeNo => throw _privateConstructorUsedError;
  int get userNo => throw _privateConstructorUsedError;
  int get star => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<int> get tags => throw _privateConstructorUsedError;
  List<File> get imgs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewFormCopyWith<ReviewForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewFormCopyWith<$Res> {
  factory $ReviewFormCopyWith(
          ReviewForm value, $Res Function(ReviewForm) then) =
      _$ReviewFormCopyWithImpl<$Res, ReviewForm>;
  @useResult
  $Res call(
      {int storeNo,
      int userNo,
      int star,
      String content,
      List<int> tags,
      List<File> imgs});
}

/// @nodoc
class _$ReviewFormCopyWithImpl<$Res, $Val extends ReviewForm>
    implements $ReviewFormCopyWith<$Res> {
  _$ReviewFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeNo = null,
    Object? userNo = null,
    Object? star = null,
    Object? content = null,
    Object? tags = null,
    Object? imgs = null,
  }) {
    return _then(_value.copyWith(
      storeNo: null == storeNo
          ? _value.storeNo
          : storeNo // ignore: cast_nullable_to_non_nullable
              as int,
      userNo: null == userNo
          ? _value.userNo
          : userNo // ignore: cast_nullable_to_non_nullable
              as int,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<int>,
      imgs: null == imgs
          ? _value.imgs
          : imgs // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewFormCopyWith<$Res>
    implements $ReviewFormCopyWith<$Res> {
  factory _$$_ReviewFormCopyWith(
          _$_ReviewForm value, $Res Function(_$_ReviewForm) then) =
      __$$_ReviewFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int storeNo,
      int userNo,
      int star,
      String content,
      List<int> tags,
      List<File> imgs});
}

/// @nodoc
class __$$_ReviewFormCopyWithImpl<$Res>
    extends _$ReviewFormCopyWithImpl<$Res, _$_ReviewForm>
    implements _$$_ReviewFormCopyWith<$Res> {
  __$$_ReviewFormCopyWithImpl(
      _$_ReviewForm _value, $Res Function(_$_ReviewForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeNo = null,
    Object? userNo = null,
    Object? star = null,
    Object? content = null,
    Object? tags = null,
    Object? imgs = null,
  }) {
    return _then(_$_ReviewForm(
      storeNo: null == storeNo
          ? _value.storeNo
          : storeNo // ignore: cast_nullable_to_non_nullable
              as int,
      userNo: null == userNo
          ? _value.userNo
          : userNo // ignore: cast_nullable_to_non_nullable
              as int,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<int>,
      imgs: null == imgs
          ? _value._imgs
          : imgs // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ));
  }
}

/// @nodoc

class _$_ReviewForm with DiagnosticableTreeMixin implements _ReviewForm {
  const _$_ReviewForm(
      {required this.storeNo,
      required this.userNo,
      required this.star,
      required this.content,
      required final List<int> tags,
      required final List<File> imgs})
      : _tags = tags,
        _imgs = imgs;

  @override
  final int storeNo;
  @override
  final int userNo;
  @override
  final int star;
  @override
  final String content;
  final List<int> _tags;
  @override
  List<int> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<File> _imgs;
  @override
  List<File> get imgs {
    if (_imgs is EqualUnmodifiableListView) return _imgs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgs);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewForm(storeNo: $storeNo, userNo: $userNo, star: $star, content: $content, tags: $tags, imgs: $imgs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReviewForm'))
      ..add(DiagnosticsProperty('storeNo', storeNo))
      ..add(DiagnosticsProperty('userNo', userNo))
      ..add(DiagnosticsProperty('star', star))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('imgs', imgs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewForm &&
            (identical(other.storeNo, storeNo) || other.storeNo == storeNo) &&
            (identical(other.userNo, userNo) || other.userNo == userNo) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._imgs, _imgs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      storeNo,
      userNo,
      star,
      content,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_imgs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewFormCopyWith<_$_ReviewForm> get copyWith =>
      __$$_ReviewFormCopyWithImpl<_$_ReviewForm>(this, _$identity);
}

abstract class _ReviewForm implements ReviewForm {
  const factory _ReviewForm(
      {required final int storeNo,
      required final int userNo,
      required final int star,
      required final String content,
      required final List<int> tags,
      required final List<File> imgs}) = _$_ReviewForm;

  @override
  int get storeNo;
  @override
  int get userNo;
  @override
  int get star;
  @override
  String get content;
  @override
  List<int> get tags;
  @override
  List<File> get imgs;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewFormCopyWith<_$_ReviewForm> get copyWith =>
      throw _privateConstructorUsedError;
}
