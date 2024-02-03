// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_clean_architecture_with_firebase/core/const.dart';
import 'package:flutter_clean_architecture_with_firebase/core/utils.dart';

import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/data/data-sources/remote/firebase_auth_remote_data_source.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/data/models/user_model.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/entities/user_entity.dart';

class FireBaseRemoteDataSourceImpl extends FireBaseRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  FireBaseRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });

  @override
  Future<void> createNewUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection(FireBaseConst.users);
    final uid = await getCurrentId();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
              uid: user.uid,
              name: user.name,
              email: user.email,
              password: user.password)
          .toJson();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      //utils.successShowToast(context, error);

      print(error);
    });
  }

  @override
  Future<String> getCurrentId() async => firebaseAuth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser!.uid != null;
  @override
  Future<void> resetPassword(UserEntity user) async {
    await firebaseAuth.sendPasswordResetEmail(email: user.email!);
  }

  @override
  Future<void> signIn(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty && user.password!.isNotEmpty) {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: user.email!, password: user.password!);
      } else {
        print('Field Cant be Empty');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == FireBaseConst.user_not_found) {
        print(FireBaseConst.user_not_found);
      } else if (e.code == FireBaseConst.wrong_password_or_email) {
        print(FireBaseConst.wrong_password_or_email);
      }
    } catch (e) {}
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!)
          .then((value) async {
        if (value.user?.uid != null) {
          await createNewUser(user);
        }
      });
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == FireBaseConst.email_already_in_use) {
        print(FireBaseConst.email_already_in_use);
      } else {
        print('Something Went Wrong');
      }
    } catch (e) {
      print(e);
    }
  }
}
