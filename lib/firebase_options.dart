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
    apiKey: 'AIzaSyBD8JXG7MtRJPLZOz7S3GLBrlF_nhM-kyw',
    appId: '1:545065300544:web:be28accd5750516a9b25a5',
    messagingSenderId: '545065300544',
    projectId: 'ecommerce-flutter-ded87',
    authDomain: 'ecommerce-flutter-ded87.firebaseapp.com',
    storageBucket: 'ecommerce-flutter-ded87.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiPu_grhoVoHe762FrSBOUbL_0f6uNUKk',
    appId: '1:545065300544:android:5103636a8bd03ad69b25a5',
    messagingSenderId: '545065300544',
    projectId: 'ecommerce-flutter-ded87',
    storageBucket: 'ecommerce-flutter-ded87.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD26-P9xLEuqvZ2swpIYO9Wr5FcHT2wlGU',
    appId: '1:545065300544:ios:ee56830193927cba9b25a5',
    messagingSenderId: '545065300544',
    projectId: 'ecommerce-flutter-ded87',
    storageBucket: 'ecommerce-flutter-ded87.appspot.com',
    iosClientId: '545065300544-iq4t07t71td07ioalhhvmjr698huduaj.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD26-P9xLEuqvZ2swpIYO9Wr5FcHT2wlGU',
    appId: '1:545065300544:ios:ee56830193927cba9b25a5',
    messagingSenderId: '545065300544',
    projectId: 'ecommerce-flutter-ded87',
    storageBucket: 'ecommerce-flutter-ded87.appspot.com',
    iosClientId: '545065300544-iq4t07t71td07ioalhhvmjr698huduaj.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseProject',
  );
}
