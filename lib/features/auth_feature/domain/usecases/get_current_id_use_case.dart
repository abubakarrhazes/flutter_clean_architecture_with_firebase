// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/repositories/firebase_auth_repository.dart';

class GetCurrentIdUseCase {
  final FirebaseAuthRepository firebaseAuthRepository;

  GetCurrentIdUseCase({
    required this.firebaseAuthRepository,
  });

  Future<String> call() {
    return firebaseAuthRepository.getCurrentId();
  }
}
