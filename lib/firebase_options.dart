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
    apiKey: 'AIzaSyAtcn2gViBb54obZ7HoIyr3nxuM3iPbAVE',
    appId: '1:64762181402:web:74270e0ee5ef992d19dea3',
    messagingSenderId: '64762181402',
    projectId: 'fir-practice-ac759',
    authDomain: 'fir-practice-ac759.firebaseapp.com',
    databaseURL: 'https://fir-practice-ac759.firebaseio.com',
    storageBucket: 'fir-practice-ac759.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaxMrwqu29rLhOp0ChKYAoSZ2zeDCYzeE',
    appId: '1:64762181402:android:03c97454ccfefea519dea3',
    messagingSenderId: '64762181402',
    projectId: 'fir-practice-ac759',
    databaseURL: 'https://fir-practice-ac759.firebaseio.com',
    storageBucket: 'fir-practice-ac759.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5WxTwsuI19UBEl4XYPXykpAlJwtDiJXc',
    appId: '1:64762181402:ios:21c682c65c2c7cc419dea3',
    messagingSenderId: '64762181402',
    projectId: 'fir-practice-ac759',
    databaseURL: 'https://fir-practice-ac759.firebaseio.com',
    storageBucket: 'fir-practice-ac759.appspot.com',
    androidClientId: '64762181402-916tpemlfihcs25f47fetmpr68hlqddv.apps.googleusercontent.com',
    iosBundleId: 'com.example.buscaroFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5WxTwsuI19UBEl4XYPXykpAlJwtDiJXc',
    appId: '1:64762181402:ios:21c682c65c2c7cc419dea3',
    messagingSenderId: '64762181402',
    projectId: 'fir-practice-ac759',
    databaseURL: 'https://fir-practice-ac759.firebaseio.com',
    storageBucket: 'fir-practice-ac759.appspot.com',
    androidClientId: '64762181402-916tpemlfihcs25f47fetmpr68hlqddv.apps.googleusercontent.com',
    iosBundleId: 'com.example.buscaroFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAtcn2gViBb54obZ7HoIyr3nxuM3iPbAVE',
    appId: '1:64762181402:web:502983e2d761357b19dea3',
    messagingSenderId: '64762181402',
    projectId: 'fir-practice-ac759',
    authDomain: 'fir-practice-ac759.firebaseapp.com',
    databaseURL: 'https://fir-practice-ac759.firebaseio.com',
    storageBucket: 'fir-practice-ac759.appspot.com',
  );

}