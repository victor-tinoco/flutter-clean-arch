import 'package:squadmobile_base_project/app/domain/entities/user.dart';

class UserRequest {
  final String next;
  final List<UserEntity> users;

  UserRequest({
    this.next,
    this.users,
  });
}
