import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/reset_password_use_case.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/sign_in_use_case.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/sign_up_use_case.dart';

part 'credentials_state.dart';

class CredentialsCubit extends Cubit<CredentialsState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ResetPasswordUser resetPasswordUser;
  CredentialsCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.resetPasswordUser,
  }) : super(CredentialsInitial());

  Future<void> signInUser(
      {required String email, required String password}) async {
    emit(CredentialsLoading());
    try {
      await signInUseCase.call(
        UserEntity(email: email, password: password),
      );
      emit(CredentialsSuccess());
    } on SocketException catch (_) {
      emit(CredentialsFailure());
    } catch (_) {
      emit(CredentialsFailure());
    }
  }

  //Sign Up

  Future<void> signUpUser({required UserEntity user}) async {
    emit(CredentialsLoading());
    try {
      await signUpUseCase.call(user);
      emit(CredentialsSuccess());
    } on SocketException catch (_) {
      emit(CredentialsFailure());
    } catch (_) {
      emit(CredentialsFailure());
    }
  }

  //Reset Password

  Future<void> resetPassword({required String email}) async {
    emit(CredentialsLoading());
    try {
      await resetPasswordUser.call(
        UserEntity(email: email),
      );
      emit(CredentialsSuccess());
    } on SocketException catch (_) {
      emit(CredentialsFailure());
    } catch (_) {
      emit(CredentialsFailure());
    }
  }
}
