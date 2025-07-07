import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: 'SUA_API_KEY',
        authDomain: 'SEU_AUTH_DOMAIN.firebaseapp.com',
        projectId: 'SEU_PROJECT_ID',
        storageBucket: 'SEU_PROJECT_ID.appspot.com',
        messagingSenderId: 'SEU_MESSAGING_SENDER_ID',
        appId: 'SEU_APP_ID',
        measurementId: 'SUA_MEASUREMENT_ID',
      );
    }

    // Android
    return const FirebaseOptions(
      apiKey: 'SUA_API_KEY',
      appId: 'SEU_APP_ID_ANDROID',
      messagingSenderId: 'SEU_MESSAGING_SENDER_ID',
      projectId: 'SEU_PROJECT_ID',
      storageBucket: 'SEU_PROJECT_ID.appspot.com',
    );
  }
}
