// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/repositories/firebase_auth_repository.dart';

class SignOutUseCase {
  final FirebaseAuthRepository firebaseAuthRepository;

  SignOutUseCase({
    required this.firebaseAuthRepository,
  });
  Future<void> call() {
    return firebaseAuthRepository.signOut();
  }
}
