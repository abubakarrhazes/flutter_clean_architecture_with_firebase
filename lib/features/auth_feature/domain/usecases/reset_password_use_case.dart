// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/repositories/firebase_auth_repository.dart';

class ResetPasswordUser {
  final FirebaseAuthRepository firebaseAuthRepository;
  ResetPasswordUser({
    required this.firebaseAuthRepository,
  });

  Future<void> call(UserEntity user) {
    return firebaseAuthRepository.resetPassword(user);
  }
}
