import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/repositories/firebase_auth_repository.dart';

class SignUpUseCase {
  final FirebaseAuthRepository firebaseAuthRepository;

  SignUpUseCase({required this.firebaseAuthRepository});

  Future<void> call(UserEntity user) {
    return firebaseAuthRepository.signUp(user);
  }
}
