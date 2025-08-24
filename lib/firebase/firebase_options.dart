import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform => web;

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "dummy",
    authDomain: "dummy.firebaseapp.com",
    projectId: "dummy",
    storageBucket: "dummy.appspot.com",
    messagingSenderId: "dummy",
    appId: "dummy",
  );
}
