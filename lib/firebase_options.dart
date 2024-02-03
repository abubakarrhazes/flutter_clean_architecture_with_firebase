// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC1ysJKejovB41gR_kc7jodbd1Yt0RxFRQ',
    appId: '1:460203734883:web:410013638e576ab2694556',
    messagingSenderId: '460203734883',
    projectId: 'clean-architecture-63906',
    authDomain: 'clean-architecture-63906.firebaseapp.com',
    storageBucket: 'clean-architecture-63906.appspot.com',
    measurementId: 'G-F5D72F5DZG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkIrO1D6WH9_ri249XuaLb0l3r1TBgSJQ',
    appId: '1:460203734883:android:35be2fa9e45eb45f694556',
    messagingSenderId: '460203734883',
    projectId: 'clean-architecture-63906',
    storageBucket: 'clean-architecture-63906.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcwDPGsPLrTxrYToReB9zqLWhDboUWcAE',
    appId: '1:460203734883:ios:f77fab72ca10ccaf694556',
    messagingSenderId: '460203734883',
    projectId: 'clean-architecture-63906',
    storageBucket: 'clean-architecture-63906.appspot.com',
    iosBundleId: 'com.example.flutterCleanArchitectureWithFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcwDPGsPLrTxrYToReB9zqLWhDboUWcAE',
    appId: '1:460203734883:ios:ef8a586ba927c918694556',
    messagingSenderId: '460203734883',
    projectId: 'clean-architecture-63906',
    storageBucket: 'clean-architecture-63906.appspot.com',
    iosBundleId: 'com.example.flutterCleanArchitectureWithFirebase.RunnerTests',
  );
}
