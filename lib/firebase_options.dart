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
    apiKey: 'AIzaSyBaPu0Z2P1rU3GQI-MqHM5EbETUpeiT-w4',
    appId: '1:884292096756:web:8cba8648dc6605866e04a1',
    messagingSenderId: '884292096756',
    projectId: 'myflutter-update',
    authDomain: 'myflutter-update.firebaseapp.com',
    databaseURL: 'https://myflutter-update-default-rtdb.firebaseio.com',
    storageBucket: 'myflutter-update.appspot.com',
    measurementId: 'G-50W6S4VG84',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcTsLQvfH1JL4XvnRt9Si2qCrmQRq9sXU',
    appId: '1:884292096756:android:b64a932d18a3a3176e04a1',
    messagingSenderId: '884292096756',
    projectId: 'myflutter-update',
    databaseURL: 'https://myflutter-update-default-rtdb.firebaseio.com',
    storageBucket: 'myflutter-update.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKKEMAofat3VXk9hNjUJb7Li52qzEp128',
    appId: '1:884292096756:ios:0018bd22446eabbf6e04a1',
    messagingSenderId: '884292096756',
    projectId: 'myflutter-update',
    databaseURL: 'https://myflutter-update-default-rtdb.firebaseio.com',
    storageBucket: 'myflutter-update.appspot.com',
    iosBundleId: 'com.example.flutterReviewerMain',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKKEMAofat3VXk9hNjUJb7Li52qzEp128',
    appId: '1:884292096756:ios:0018bd22446eabbf6e04a1',
    messagingSenderId: '884292096756',
    projectId: 'myflutter-update',
    databaseURL: 'https://myflutter-update-default-rtdb.firebaseio.com',
    storageBucket: 'myflutter-update.appspot.com',
    iosBundleId: 'com.example.flutterReviewerMain',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBaPu0Z2P1rU3GQI-MqHM5EbETUpeiT-w4',
    appId: '1:884292096756:web:022e9c9b6013130a6e04a1',
    messagingSenderId: '884292096756',
    projectId: 'myflutter-update',
    authDomain: 'myflutter-update.firebaseapp.com',
    databaseURL: 'https://myflutter-update-default-rtdb.firebaseio.com',
    storageBucket: 'myflutter-update.appspot.com',
    measurementId: 'G-9J1QNCFBTN',
  );

}