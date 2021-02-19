import 'package:mobx/mobx.dart';
import 'package:squadmobile_base_project/app/data/source/remote/http_protocols/custom_http_client.dart';
import 'package:squadmobile_base_project/core/entities/user.dart';
import 'package:squadmobile_base_project/core/usecases/list_users_usecase.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ListUsersUseCase _listUsersUseCase;

  _HomeControllerBase(this._listUsersUseCase);

  @observable
  ObservableFuture<List<User>> _usersRequest = ObservableFuture.value(null);

  ObservableFuture<List<User>> get usersRequest => _usersRequest;

  @computed
  bool get isLoading => _usersRequest.status == FutureStatus.pending;

  @action
  void fetchUsers() {
    _usersRequest = _listUsersUseCase.execute().asObservable();

    _usersRequest.error as RequestException;
  }
}
