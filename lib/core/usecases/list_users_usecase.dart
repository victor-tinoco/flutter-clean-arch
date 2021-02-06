import 'package:squadmobile_base_project/core/entities/user.dart';

abstract class ListUsersUseCase {
  Future<List<User>> execute();
}
