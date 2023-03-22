// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_tag_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewTagFilter {
  int get tagLength => throw _privateConstructorUsedError;
  int get selected => throw _privateConstructorUsedError;
  List<bool> get selectedState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewTagFilterCopyWith<ReviewTagFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewTagFilterCopyWith<$Res> {
  factory $ReviewTagFilterCopyWith(
          ReviewTagFilter value, $Res Function(ReviewTagFilter) then) =
      _$ReviewTagFilterCopyWithImpl<$Res, ReviewTagFilter>;
  @useResult
  $Res call({int tagLength, int selected, List<bool> selectedState});
}

/// @nodoc
class _$ReviewTagFilterCopyWithImpl<$Res, $Val extends ReviewTagFilter>
    implements $ReviewTagFilterCopyWith<$Res> {
  _$ReviewTagFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagLength = null,
    Object? selected = null,
    Object? selectedState = null,
  }) {
    return _then(_value.copyWith(
      tagLength: null == tagLength
          ? _value.tagLength
          : tagLength // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
      selectedState: null == selectedState
          ? _value.selectedState
          : selectedState // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewTagFilterCopyWith<$Res>
    implements $ReviewTagFilterCopyWith<$Res> {
  factory _$$_ReviewTagFilterCopyWith(
          _$_ReviewTagFilter value, $Res Function(_$_ReviewTagFilter) then) =
      __$$_ReviewTagFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tagLength, int selected, List<bool> selectedState});
}

/// @nodoc
class __$$_ReviewTagFilterCopyWithImpl<$Res>
    extends _$ReviewTagFilterCopyWithImpl<$Res, _$_ReviewTagFilter>
    implements _$$_ReviewTagFilterCopyWith<$Res> {
  __$$_ReviewTagFilterCopyWithImpl(
      _$_ReviewTagFilter _value, $Res Function(_$_ReviewTagFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagLength = null,
    Object? selected = null,
    Object? selectedState = null,
  }) {
    return _then(_$_ReviewTagFilter(
      tagLength: null == tagLength
          ? _value.tagLength
          : tagLength // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
      selectedState: null == selectedState
          ? _value._selectedState
          : selectedState // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _$_ReviewTagFilter
    with DiagnosticableTreeMixin
    implements _ReviewTagFilter {
  const _$_ReviewTagFilter(
      {required this.tagLength,
      required this.selected,
      required final List<bool> selectedState})
      : _selectedState = selectedState;

  @override
  final int tagLength;
  @override
  final int selected;
  final List<bool> _selectedState;
  @override
  List<bool> get selectedState {
    if (_selectedState is EqualUnmodifiableListView) return _selectedState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedState);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewTagFilter(tagLength: $tagLength, selected: $selected, selectedState: $selectedState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReviewTagFilter'))
      ..add(DiagnosticsProperty('tagLength', tagLength))
      ..add(DiagnosticsProperty('selected', selected))
      ..add(DiagnosticsProperty('selectedState', selectedState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewTagFilter &&
            (identical(other.tagLength, tagLength) ||
                other.tagLength == tagLength) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            const DeepCollectionEquality()
                .equals(other._selectedState, _selectedState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tagLength, selected,
      const DeepCollectionEquality().hash(_selectedState));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewTagFilterCopyWith<_$_ReviewTagFilter> get copyWith =>
      __$$_ReviewTagFilterCopyWithImpl<_$_ReviewTagFilter>(this, _$identity);
}

abstract class _ReviewTagFilter implements ReviewTagFilter {
  const factory _ReviewTagFilter(
      {required final int tagLength,
      required final int selected,
      required final List<bool> selectedState}) = _$_ReviewTagFilter;

  @override
  int get tagLength;
  @override
  int get selected;
  @override
  List<bool> get selectedState;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewTagFilterCopyWith<_$_ReviewTagFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
