import 'package:json_annotation/json_annotation.dart';

part 'signup.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "userNo")
  int userNo;

  @JsonKey(name: "nickname")
  String nickname;

  User({required this.userNo, required this.nickname});

  User.init()
      : userNo = 0,
        nickname = "";

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserRequest {
  @JsonKey(name: "nickname")
  final String nickname;

  UserRequest({required this.nickname});

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
