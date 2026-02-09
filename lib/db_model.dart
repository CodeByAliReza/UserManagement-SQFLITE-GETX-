class DbModel {
  final int? id;
  final String name;
  final String email;

  DbModel({this.id, required this.name, required this.email});

  factory DbModel.fromMap(Map<String, dynamic> map) {
    return DbModel(
      id: map['id'],
      name: map['name'.toLowerCase()],
      email: map['email'.toLowerCase()],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email};
  }
}
