// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userNo: json['userNo'] as int,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userNo': instance.userNo,
      'nickname': instance.nickname,
    };

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
    };
