class User {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  User(this.id, this.email, this.firstName, this.lastName, this.avatar);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['id'], json['email'], json['firstName'], json['lastName'],
        json['avatar']);
  }
}

// class Argumentos {
//   final int? id;
//   final String? nome;
//   final String? email;
//   final String? avatar;

//   Argumentos(this.id, this.nome, this.email, this.avatar);
// }
