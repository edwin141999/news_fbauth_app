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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCBHnX5nmNrw8YxFQsic7hLsl_VHdqKYzU',
    appId: '1:645142660688:web:1ec6fc79ded519b63b7355',
    messagingSenderId: '645142660688',
    projectId: 'prueba-bambu-mobile-b3008',
    authDomain: 'prueba-bambu-mobile-b3008.firebaseapp.com',
    databaseURL: 'https://prueba-bambu-mobile-b3008-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-bambu-mobile-b3008.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEoqPuQ2rgvLLG_I5AiseQJGT-YA_n7bg',
    appId: '1:645142660688:android:1a8409bb4c29be8c3b7355',
    messagingSenderId: '645142660688',
    projectId: 'prueba-bambu-mobile-b3008',
    databaseURL: 'https://prueba-bambu-mobile-b3008-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-bambu-mobile-b3008.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA1v434ZZpwdt5IszeS_UcZv1D8Zr6C59w',
    appId: '1:645142660688:ios:b6195642e810e0143b7355',
    messagingSenderId: '645142660688',
    projectId: 'prueba-bambu-mobile-b3008',
    databaseURL: 'https://prueba-bambu-mobile-b3008-default-rtdb.firebaseio.com',
    storageBucket: 'prueba-bambu-mobile-b3008.appspot.com',
    iosClientId: '645142660688-74rh3cv35ar6igk94v50pdh0t01pl362.apps.googleusercontent.com',
    iosBundleId: 'com.example.newsFbauthApp',
  );
}
