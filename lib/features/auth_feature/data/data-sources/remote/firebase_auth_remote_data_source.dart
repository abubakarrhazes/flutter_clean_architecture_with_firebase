import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/entities/user_entity.dart';

abstract class FireBaseRemoteDataSource {
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> resetPassword(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();

  //User
  Future<String> getCurrentId();
  Future<void> createNewUser(UserEntity user);
}
