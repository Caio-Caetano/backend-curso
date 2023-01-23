
// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final int? id;
  final String user;
  final String pass;
  final String? token;

  UserModel(this.id, this.user, this.pass, this.token);

  @override
  String toString() {
    return 'UserModel(id: $id, user: $user, pass: $pass, token: $token)';
  }

  factory UserModel.fromJson(Map map) {
    return UserModel(
      map['id'] ?? '',
      map['user'],
      map['pass'],
      map['token']
    );
  }

  Map toJson() {
    return {
      'id': id,
      'user': user,
      'pass': pass,
      'token': token
    };
  }
}
