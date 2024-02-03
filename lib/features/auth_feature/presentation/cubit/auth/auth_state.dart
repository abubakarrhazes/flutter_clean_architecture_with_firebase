// ignore_for_file: prefer_const_constructors_in_immutables

part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class Authenticated extends AuthState {
  Authenticated({required this.uid});
  final String uid;

  @override
  List<Object> get props => [
    uid
  ];
}

final class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}
