class UserModel {
  final String id, username, email, group, password;

  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.group,
      required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      group: json['group'],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'group': group,
        'email': email,
      };
}
