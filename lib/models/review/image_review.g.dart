// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageReviewItemModel _$ImageReviewItemModelFromJson(
        Map<String, dynamic> json) =>
    ImageReviewItemModel(
      id: json['reviewImgNo'] as int,
      imgUrl: json['imgUrl'] as String,
    );

Map<String, dynamic> _$ImageReviewItemModelToJson(
        ImageReviewItemModel instance) =>
    <String, dynamic>{
      'reviewImgNo': instance.id,
      'imgUrl': instance.imgUrl,
    };
