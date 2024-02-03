import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/get_current_id_use_case.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/is_sign_in_use_case.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/sign_out_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignOutUseCase signOutUseCase;
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentIdUseCase getCurrentIdUseCase;
  AuthCubit({
    required this.signOutUseCase,
    required this.isSignInUseCase,
    required this.getCurrentIdUseCase,
  }) : super(AuthInitial());

  // Check If User Is SigniN

  Future<void> appStarted(BuildContext context) async {
    try {
      bool isSignIn = await isSignInUseCase.call();

      if (isSignIn == true) {
        final uid = await getCurrentIdUseCase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  //Login Function
  Future<void> login() async {
    try {
      final uid = await getCurrentIdUseCase.call();
      emit(Authenticated(uid: uid));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  //Logout

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
