import 'package:squadmobile_base_project/core/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUserList();
}
