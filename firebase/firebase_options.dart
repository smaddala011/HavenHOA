// Dummy Firebase config placeholder
class DefaultFirebaseOptions {
  static get currentPlatform => web;

  static const web = FirebaseOptions(
    apiKey: "dummy_api_key",
    authDomain: "dummy-project.firebaseapp.com",
    projectId: "dummy-project",
    storageBucket: "dummy-project.appspot.com",
    messagingSenderId: "1234567890",
    appId: "1:1234567890:web:dummyappid",
  );
}

class FirebaseOptions {
  final String apiKey;
  final String authDomain;
  final String projectId;
  final String storageBucket;
  final String messagingSenderId;
  final String appId;

  const FirebaseOptions({
    required this.apiKey,
    required this.authDomain,
    required this.projectId,
    required this.storageBucket,
    required this.messagingSenderId,
    required this.appId,
  });
}
