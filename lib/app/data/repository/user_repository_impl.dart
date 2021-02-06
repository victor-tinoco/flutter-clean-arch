import 'package:squadmobile_base_project/app/data/source/remote/user_remote_data_source.dart';
import 'package:squadmobile_base_project/app/domain/entities/user.dart';
import 'package:squadmobile_base_project/core/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);

  @override
  Future<List<UserEntity>> getUserList() async {
    return await _userRemoteDataSource.getUserList();
  }
}
