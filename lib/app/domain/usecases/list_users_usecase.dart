import 'package:squadmobile_base_project/app/domain/entities/user.dart';
import 'package:squadmobile_base_project/core/repositories/user_repository.dart';
import 'package:squadmobile_base_project/core/usecases/list_users_usecase.dart';

class ListUsersUseCaseImpl implements ListUsersUseCase {
  UserRepository _repos;

  ListUsersUseCaseImpl(this._repos);

  Future<List<UserEntity>> execute() {
    return _repos.getUserList();
  }
}
