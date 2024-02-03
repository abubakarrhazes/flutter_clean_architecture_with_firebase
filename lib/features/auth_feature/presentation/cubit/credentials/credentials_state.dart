part of 'credentials_cubit.dart';

sealed class CredentialsState extends Equatable {
  const CredentialsState();
}

final class CredentialsInitial extends CredentialsState {
  @override
  List<Object> get props => [];
}

final class CredentialsLoading extends CredentialsState {
  @override
  List<Object> get props => [];
}

final class CredentialsSuccess extends CredentialsState {
  @override
  List<Object> get props => [];
}

final class CredentialsFailure extends CredentialsState {
  @override
  List<Object> get props => [];
}
