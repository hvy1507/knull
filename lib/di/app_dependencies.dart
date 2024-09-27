import 'package:dio/dio.dart';
import 'package:skeleton/base/app_dependencies.base.dart';
import 'package:skeleton/data/data_source/remote/impl/user.repo.impl.dart';
import 'package:skeleton/data/repository/user.repo.dart';

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
  void registerRepositories() {
    di.registerLazySingleton<UserRepo>(() {
      return UserRepoImpl();
    });
  }

  @override
  void registerLocalDatasource() {}

  @override
  void registerRemoteDatasource() {}
}
