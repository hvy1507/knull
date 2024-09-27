import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skeleton/data/model/user.model.dart';
import 'package:skeleton/data/repository/user.repo.dart';

class UserRepoImpl extends UserRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collection = 'users';

  @override
  Future<User> getUser(String userId) async {
    try {
      DocumentSnapshot doc = await _db.collection(_collection).doc(userId).get();
      if (doc.exists) {
        return User.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  @override
  Future<void> updateUser(String userId, User user) async {
    try {
      await _db.collection(_collection).doc(userId).update(user.toMap());
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  @override
  Future<void> createUser(User user) async {
    try {
      await _db.collection(_collection).add(user.toMap());
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    try {
      await _db.collection(_collection).doc(userId).delete();
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

  // Phương thức bổ sung để lấy tất cả users
  Stream<List<User>> getAllUsers() {
    return _db.collection(_collection).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => User.fromMap(doc.data())).toList();
    });
  }
}