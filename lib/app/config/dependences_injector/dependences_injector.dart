import 'package:get_it/get_it.dart';
import 'package:squadmobile_base_project/app/config/dependences_injector/module_injectors/home_injector.dart';
import 'package:squadmobile_base_project/app/config/dependences_injector/module_injectors/shareds_injector.dart';

typedef FactoryFunc<T> = T Function();

class DependencesInjector {
  static final GetIt _locator = GetIt.I;

  static T get<T>({String instanceName}) {
    return _locator.get<T>(instanceName: instanceName);
  }

  static void registerFactory<T>(
    FactoryFunc<T> factoryFunc, {
    String instanceName,
  }) {
    _locator.registerFactory(factoryFunc, instanceName: instanceName);
  }

  static void registerLazySingleton<T>(
    FactoryFunc<T> factoryFunc, {
    String instanceName,
    DisposingFunc<T> dispose,
  }) {
    _locator.registerLazySingleton(
      factoryFunc,
      instanceName: instanceName,
      dispose: dispose,
    );
  }

  static void setupDependencies() {
    setupSharedsInjector();
    setupHomeModuleInjection();
  }
}
