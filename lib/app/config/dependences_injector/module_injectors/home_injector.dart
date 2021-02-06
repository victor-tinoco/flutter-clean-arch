import 'package:squadmobile_base_project/app/config/dependences_injector/dependences_injector.dart';
import 'package:squadmobile_base_project/app/data/mapper/user_mapper.dart';
import 'package:squadmobile_base_project/app/data/mapper/user_request_mapper.dart';
import 'package:squadmobile_base_project/app/domain/entities/user_request.dart';
import 'package:squadmobile_base_project/app/domain/usecases/list_users_usecase.dart';
import 'package:squadmobile_base_project/app/presentation/pages/home/home_controller.dart';
import 'package:squadmobile_base_project/core/entities/class_mapper.dart';
import 'package:squadmobile_base_project/core/entities/user.dart';
import 'package:squadmobile_base_project/core/repositories/user_repository.dart';
import 'package:squadmobile_base_project/core/usecases/list_users_usecase.dart';

void setupHomeModuleInjection() {
  _injectControllers();
  _injectUseCases();
  _injectMappers();
}

void _injectControllers() {
  DependencesInjector.registerFactory<HomeController>(() {
    return HomeController(
      DependencesInjector.get<ListUsersUseCase>(),
    );
  });
}

void _injectUseCases() {
  DependencesInjector.registerFactory<ListUsersUseCase>(() {
    return ListUsersUseCaseImpl(
      DependencesInjector.get<UserRepository>(),
    );
  });
}

void _injectMappers() {
  DependencesInjector.registerFactory<ClassMapper<User>>(() => UserMapper());
  DependencesInjector.registerFactory<ClassMapper<UserRequest>>(() {
    return UserRequestMapper(
      DependencesInjector.get<ClassMapper<User>>(),
    );
  });
}
