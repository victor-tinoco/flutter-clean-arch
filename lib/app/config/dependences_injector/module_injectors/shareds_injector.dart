import 'package:dio/dio.dart';
import 'package:squadmobile_base_project/app/config/dependences_injector/dependences_injector.dart';
import 'package:squadmobile_base_project/app/config/helpers/cache_helper.dart';
import 'package:squadmobile_base_project/app/config/helpers/encrypt_helper.dart';
import 'package:squadmobile_base_project/app/config/helpers/navigator_helper.dart';
import 'package:squadmobile_base_project/app/data/repository/user_repository_impl.dart';
import 'package:squadmobile_base_project/app/data/source/local/token_local_data_source.dart';
import 'package:squadmobile_base_project/app/data/source/remote/http_protocols/custom_http_client.dart';
import 'package:squadmobile_base_project/app/data/source/remote/http_protocols/custom_interceptor.dart';
import 'package:squadmobile_base_project/app/data/source/remote/http_protocols/utils/http_client.dart';
import 'package:squadmobile_base_project/app/data/source/remote/user_remote_data_source.dart';
import 'package:squadmobile_base_project/app/domain/entities/user_request.dart';
import 'package:squadmobile_base_project/core/entities/class_mapper.dart';
import 'package:squadmobile_base_project/core/repositories/user_repository.dart';
import 'package:uuid/uuid.dart';

void setupSharedsInjector() {
  _injectRepositories();
  _injectDataSources();
  _injectUtilsAndHelpers();
}

void _injectRepositories() {
  DependencesInjector.registerFactory<UserRepository>(() {
    return UserRepositoryImpl(
      DependencesInjector.get<UserRemoteDataSource>(),
    );
  });
}

void _injectDataSources() {
  DependencesInjector.registerFactory<UserRemoteDataSource>(() {
    return UserRemoteDataSourceImpl(
      DependencesInjector.get<HttpClient>(),
      DependencesInjector.get<ClassMapper<UserRequest>>(),
    );
  });

  DependencesInjector.registerFactory<TokenLocalDataSource>(() {
    return TokenLocalDataSourceImpl(
      DependencesInjector.get<CacheHelper>(),
    );
  });
}

void _injectUtilsAndHelpers() {
  DependencesInjector.registerFactory<Dio>(() => Dio());
  DependencesInjector.registerFactory<Uuid>(() => Uuid());

  DependencesInjector.registerFactory(() {
    return CustomInterceptor(
      DependencesInjector.get<TokenLocalDataSource>(),
      DependencesInjector.get<NavigatorHelper>(),
    );
  });
  DependencesInjector.registerFactory<HttpClient>(() {
    return CustomHttpClient(DependencesInjector.get<Dio>(), [
      DependencesInjector.get<CustomInterceptor>(),
    ]);
  });

  DependencesInjector.registerFactory<NavigatorHelper>(() {
    return NavigatorHelperImpl();
  });

  DependencesInjector.registerFactory<EncryptHelper>(() {
    return EncryptHelperImpl();
  });

  DependencesInjector.registerFactory<CacheHelper>(() {
    return CacheHelperImpl(
      DependencesInjector.get<Uuid>(),
      DependencesInjector.get<EncryptHelper>(),
    );
  });
}
