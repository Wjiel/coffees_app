// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAhpz5Qt1VtgBs7RBlIVoA6rOy95almjSM',
    appId: '1:187138984960:web:7a0924aef70d6644bd5ce5',
    messagingSenderId: '187138984960',
    projectId: 'coffesshop-ee856',
    authDomain: 'coffesshop-ee856.firebaseapp.com',
    storageBucket: 'coffesshop-ee856.appspot.com',
    measurementId: 'G-M1V3S2DRTG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhjK-ENjM2uW_i52Up-K4BaUP2dPw9-_4',
    appId: '1:187138984960:android:97d8bb61147aece3bd5ce5',
    messagingSenderId: '187138984960',
    projectId: 'coffesshop-ee856',
    storageBucket: 'coffesshop-ee856.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmBDEWOj84yNzbFuKz4JuoOlTT9WCRg_w',
    appId: '1:187138984960:ios:7891a1718857cf78bd5ce5',
    messagingSenderId: '187138984960',
    projectId: 'coffesshop-ee856',
    storageBucket: 'coffesshop-ee856.appspot.com',
    iosBundleId: 'com.example.coffeesAplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmBDEWOj84yNzbFuKz4JuoOlTT9WCRg_w',
    appId: '1:187138984960:ios:7891a1718857cf78bd5ce5',
    messagingSenderId: '187138984960',
    projectId: 'coffesshop-ee856',
    storageBucket: 'coffesshop-ee856.appspot.com',
    iosBundleId: 'com.example.coffeesAplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAhpz5Qt1VtgBs7RBlIVoA6rOy95almjSM',
    appId: '1:187138984960:web:7a0924aef70d6644bd5ce5',
    messagingSenderId: '187138984960',
    projectId: 'coffesshop-ee856',
    authDomain: 'coffesshop-ee856.firebaseapp.com',
    storageBucket: 'coffesshop-ee856.appspot.com',
    measurementId: 'G-M1V3S2DRTG',
  );

}