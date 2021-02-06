import 'package:squadmobile_base_project/app/domain/entities/user.dart';
import 'package:squadmobile_base_project/core/entities/class_mapper.dart';

class UserMapper implements ClassMapper<UserEntity> {
  UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(name: json['name']);
  }

  Map<String, dynamic> toJson(UserEntity user) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = user.name;
    return data;
  }
}
