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
    apiKey: 'AIzaSyBfb8WOLoeAvdbKDDejdqOYzHFAgG_DK0Y',
    appId: '1:118704648061:web:7df87a26e322ca4ff1e614',
    messagingSenderId: '118704648061',
    projectId: 'contacts-app-d3ca2',
    authDomain: 'contacts-app-d3ca2.firebaseapp.com',
    storageBucket: 'contacts-app-d3ca2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7KR3SO2H-BxIaPwnmyVNrWwpXTlmUTLk',
    appId: '1:118704648061:android:9f9df27eb1e034a9f1e614',
    messagingSenderId: '118704648061',
    projectId: 'contacts-app-d3ca2',
    storageBucket: 'contacts-app-d3ca2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAd7uLFpVaVJKul-FoQJo2AkrB5OkT6Esk',
    appId: '1:118704648061:ios:8ef023eacee4c345f1e614',
    messagingSenderId: '118704648061',
    projectId: 'contacts-app-d3ca2',
    storageBucket: 'contacts-app-d3ca2.appspot.com',
    iosClientId: '118704648061-0bgvigca71cocep2055ue0g49ep8k5ap.apps.googleusercontent.com',
    iosBundleId: 'com.example.contactsManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAd7uLFpVaVJKul-FoQJo2AkrB5OkT6Esk',
    appId: '1:118704648061:ios:303280b0f7f4d9dbf1e614',
    messagingSenderId: '118704648061',
    projectId: 'contacts-app-d3ca2',
    storageBucket: 'contacts-app-d3ca2.appspot.com',
    iosClientId: '118704648061-cr14eb8ocpkqb69l5srvr94sb1e57gok.apps.googleusercontent.com',
    iosBundleId: 'com.example.contactsManager.RunnerTests',
  );
}