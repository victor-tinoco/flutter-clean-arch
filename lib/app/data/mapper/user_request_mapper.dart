import 'package:squadmobile_base_project/app/domain/entities/user.dart';
import 'package:squadmobile_base_project/app/domain/entities/user_request.dart';
import 'package:squadmobile_base_project/core/entities/class_mapper.dart';

class UserRequestMapper implements ClassMapper<UserRequest> {
  ClassMapper<UserEntity> _userMapper;

  UserRequestMapper(_userMapper);

  UserRequest fromJson(Map<String, dynamic> json) {
    return UserRequest(
      next: json['next'] as String,
      users: json['results'].map((i) => _userMapper.fromJson(i)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson(UserRequest model) => {
        'next': model.next,
        'results': model.users,
      };
}
