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
    apiKey: 'AIzaSyC63t3n0aFQqF7YT2YogTD48LbYJSl5M18',
    appId: '1:636218329027:web:ba93bf92c80ffb735a1f76',
    messagingSenderId: '636218329027',
    projectId: 'mylife-75e52',
    authDomain: 'mylife-75e52.firebaseapp.com',
    storageBucket: 'mylife-75e52.appspot.com',
    measurementId: 'G-MP514JFNEP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1zAizIduMzA4nmLXVmmT2BVheOTkT0I8',
    appId: '1:636218329027:android:9020a8b89d9b876c5a1f76',
    messagingSenderId: '636218329027',
    projectId: 'mylife-75e52',
    storageBucket: 'mylife-75e52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKmIlFSW_2iU0AOeoFP-qgi_XzWbp3obc',
    appId: '1:636218329027:ios:1068f9bfe2a8adee5a1f76',
    messagingSenderId: '636218329027',
    projectId: 'mylife-75e52',
    storageBucket: 'mylife-75e52.appspot.com',
    iosClientId: '636218329027-mjsk06a0pccea75pnr9u0f107fa3tbli.apps.googleusercontent.com',
    iosBundleId: 'com.example.myLife',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKmIlFSW_2iU0AOeoFP-qgi_XzWbp3obc',
    appId: '1:636218329027:ios:39f1cb2175465e155a1f76',
    messagingSenderId: '636218329027',
    projectId: 'mylife-75e52',
    storageBucket: 'mylife-75e52.appspot.com',
    iosClientId: '636218329027-j0ee58stjh3453vpu4pr2vgr8sg68b2e.apps.googleusercontent.com',
    iosBundleId: 'com.example.myLife.RunnerTests',
  );
}
