import 'dart:convert';

class UserModel {


  String name;
  String number;
  String email;
  String add;
  String username;
  String pincode;
  String uid;
  UserModel({
    required this.pincode,
    required this.username,
    required this.name,
    required this.number,
    required this.email,
    required this.add,
    required this.uid,
  });


  UserModel copyWith({
    required String name,
    required String number,
    required String email,
    required String add,
    required String uid,
    required String pincode,
    required String username,
  }) {
    return UserModel(
      name: name,
      number: number,
      email: email,
      add: add,
      uid: uid,
      pincode: pincode,
      username: username,
    );
  }

  UserModel merge(UserModel model) {
    return UserModel(
      name: model.name,
      number: model.number,
      email: model.email,
      add: model.add,
      uid: model.uid,
      pincode: model.pincode,
      username: model.username
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'email': email,
      'add': add,
      'uid': uid,
      'pincode': pincode,
      'username': username
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
  
    return UserModel(
      name: map['name'],
      number: map['number'],
      email: map['email'],
      add: map['add'],
      uid: map['uid'],
      pincode: map['pincode'],
      username: map['username']
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, number: $number, email: $email, add: $add, uid: $uid, username: $username, pincode: $pincode)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserModel &&
      o.name == name &&
      o.number == number &&
      o.email == email &&
      o.add == add &&
      o.uid == uid &&
      o.pincode == pincode &&
      o.username == username;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      number.hashCode ^
      email.hashCode ^
      add.hashCode ^
      uid.hashCode ^
      pincode.hashCode ^
      username.hashCode;
  }
}
