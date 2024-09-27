class User {
  final String name;
  final String email;
  final String avatar;

  User({
    required this.name,
    required this.email,
    required this.avatar,
  });
  Map<String,dynamic> toMap() => {
    "name": name,
    "email": email,
    "avatar": avatar,
  };
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] as String,
    );
  }
}
