import 'package:skeleton/data/model/user.model.dart';

abstract class UserRepo {
  Future<User> getUser(String userId);

  Future<void> updateUser(String userId, User user);

  Future<void> createUser(User user);

  Future<void> deleteUser(String userId);
}
