import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/data/data-sources/remote/firebase_auth_remote_data_source.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/data/data-sources/remote/firebase_auth_remote_data_source_impl.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/data/repositories/firebase_auth_repository_impl.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/repositories/firebase_auth_repository.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/get_current_id_use_case.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/is_sign_in_use_case.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/reset_password_use_case.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/sign_in_use_case.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/sign_out_use_case.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/domain/usecases/sign_up_use_case.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/presentation/cubit/credentials/credentials_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register Cubit Here

  // Register AuthCubit Here
  sl.registerFactory(
    () => AuthCubit(
      signOutUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      getCurrentIdUseCase: sl.call(),
    ),
  );
  // Register CredentialCubit Here
  sl.registerFactory(
    () => CredentialsCubit(
      signInUseCase: sl.call(),
      signUpUseCase: sl.call(),
      resetPasswordUser: sl.call(),
    ),
  );

  //Register Use Case
  sl.registerLazySingleton(
    () => SignOutUseCase(
      firebaseAuthRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => IsSignInUseCase(
      firebaseAuthRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => GetCurrentIdUseCase(
      firebaseAuthRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => SignUpUseCase(
      firebaseAuthRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => SignInUseCase(
      firebaseAuthRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => ResetPasswordUser(
      firebaseAuthRepository: sl.call(),
    ),
  );

  // Register Repositories
  sl.registerLazySingleton<FirebaseAuthRepository>(
    () => FireBaseAuthRepositoryImpl(
      fireBaseRemoteDataSource: sl.call(),
    ),
  );

  //Remote Data Source
  sl.registerLazySingleton<FireBaseRemoteDataSource>(
    () => FireBaseRemoteDataSourceImpl(
      firebaseAuth: sl.call(),
      firebaseFirestore: sl.call(),
      firebaseStorage: sl.call(),
    ),
  );

  // Register External

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebasestorage = FirebaseStorage.instance;
  final firebaseAuth = FirebaseAuth.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebasestorage);
  sl.registerLazySingleton(() => firebaseAuth);
}
