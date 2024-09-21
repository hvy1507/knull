import 'package:get_it/get_it.dart';

abstract class BaseAppDependency {
  GetIt get di => GetIt.instance;

  void initiate() {
    registerDependencies();
    registerRemoteDatasource();
    registerLocalDatasource();
    registerRepositories();
  }

  void registerDependencies();

  void registerRemoteDatasource();

  void registerLocalDatasource();

  void registerRepositories();
}