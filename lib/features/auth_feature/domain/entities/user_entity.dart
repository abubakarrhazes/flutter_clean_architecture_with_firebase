// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;

  UserEntity({
    this.uid,
    this.name,
    this.email,
    this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        uid,
        name,
        email,
        password,
      ];
}
