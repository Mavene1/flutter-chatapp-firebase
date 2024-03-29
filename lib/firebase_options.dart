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
    apiKey: 'AIzaSyDPy81Jah8oE0EDTMjCBba-5_34UBgef58',
    appId: '1:1081247641154:web:e1a92cd57553a79555c7db',
    messagingSenderId: '1081247641154',
    projectId: 'chat-flutter-7fcbb',
    authDomain: 'chat-flutter-7fcbb.firebaseapp.com',
    storageBucket: 'chat-flutter-7fcbb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJ6Olk8VUdou2E6HvQfieYFju9Zl5Hc3Q',
    appId: '1:1081247641154:android:a2d6472dabe3a90b55c7db',
    messagingSenderId: '1081247641154',
    projectId: 'chat-flutter-7fcbb',
    storageBucket: 'chat-flutter-7fcbb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3tZTpk0T7Xv8orFL_-byWwjA56ESz3Pc',
    appId: '1:1081247641154:ios:3c5227a173cc295155c7db',
    messagingSenderId: '1081247641154',
    projectId: 'chat-flutter-7fcbb',
    storageBucket: 'chat-flutter-7fcbb.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3tZTpk0T7Xv8orFL_-byWwjA56ESz3Pc',
    appId: '1:1081247641154:ios:4a201635370e43a555c7db',
    messagingSenderId: '1081247641154',
    projectId: 'chat-flutter-7fcbb',
    storageBucket: 'chat-flutter-7fcbb.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
