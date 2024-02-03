// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/presentation/cubit/credentials/credentials_cubit.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/presentation/pages/login.dart';
import 'package:flutter_clean_architecture_with_firebase/features/auth_feature/presentation/pages/register.dart';
import 'package:flutter_clean_architecture_with_firebase/firebase_options.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(context),
        ),
        BlocProvider(
          create: (_) => di.sl<CredentialsCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Clean Architecture With Firebase',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return Register();
                } else {
                  return Login();
                }
              },
            );
          }
        },
      ),
    );
  }
}
