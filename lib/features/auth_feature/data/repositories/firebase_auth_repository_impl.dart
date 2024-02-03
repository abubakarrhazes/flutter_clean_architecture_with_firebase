// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/data/data-sources/remote/firebase_auth_remote_data_source.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/repositories/firebase_auth_repository.dart';

class FireBaseAuthRepositoryImpl extends FirebaseAuthRepository {
  final FireBaseRemoteDataSource fireBaseRemoteDataSource;
  FireBaseAuthRepositoryImpl({
    required this.fireBaseRemoteDataSource,
  });

  @override
  Future<void> createNewUser(UserEntity user) async =>
      await fireBaseRemoteDataSource.createNewUser(user);

  @override
  Future<String> getCurrentId() async =>
      await fireBaseRemoteDataSource.getCurrentId();
  @override
  Future<bool> isSignIn() async =>
      await fireBaseRemoteDataSource.isSignIn();

  @override
  Future<void> resetPassword(UserEntity user) async =>
      await fireBaseRemoteDataSource.resetPassword(user);

  @override
  Future<void> signIn(UserEntity user) async =>
      await fireBaseRemoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => await fireBaseRemoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async =>
      await fireBaseRemoteDataSource.signUp(user);
}
