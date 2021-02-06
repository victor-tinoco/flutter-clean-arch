import 'package:squadmobile_base_project/app/data/source/remote/http_protocols/custom_http_client.dart';
import 'package:squadmobile_base_project/app/data/source/remote/http_protocols/endpoints.dart';
import 'package:squadmobile_base_project/app/domain/entities/user.dart';
import 'package:squadmobile_base_project/app/domain/entities/user_request.dart';
import 'package:squadmobile_base_project/core/entities/class_mapper.dart';
import 'package:squadmobile_base_project/core/entities/user.dart';

abstract class UserRemoteDataSource {
  Future<List<User>> getUserList();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  CustomHttpClient _http;
  ClassMapper<UserRequest> _userRequestMapper;

  UserRemoteDataSourceImpl(this._http, this._userRequestMapper);

  @override
  Future<List<UserEntity>> getUserList() async {
    final response = await _http.get(Endpoints.user.list);
    return _userRequestMapper.fromJson(response?.data).users;
  }
}
