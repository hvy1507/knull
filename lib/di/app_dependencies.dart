import 'package:dio/dio.dart';
import 'package:skeleton/base/app_dependencies.base.dart';

class AppDependency extends BaseAppDependency {
  factory AppDependency() => _instance;

  AppDependency._();

  static final AppDependency _instance = AppDependency._();

  @override
  void registerDependencies() {
    di.registerLazySingleton<Dio>(() {
      return Dio(BaseOptions());
    });
  }

  @override
  void registerRepositories() {}

  @override
  void registerLocalDatasource() {}

  @override
  void registerRemoteDatasource() {}
}
