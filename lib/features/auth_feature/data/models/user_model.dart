// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  UserModel({
    this.uid,
    required this.name,
    required this.email,
    required this.password,
  }) : super(uid: uid, name: name, email: email, password: password);

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
        uid: snapshot['uid'],
        name: snapshot['name'],
        email: snapshot['email'],
        password: snapshot['password']);
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'password': password,
      };
}
