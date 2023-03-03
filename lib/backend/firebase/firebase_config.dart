import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBFAbSL_K9TlpngGjK-6I9FB5Rd1lPJg-4",
            authDomain: "marketplace-achado-de-luxo.firebaseapp.com",
            projectId: "marketplace-achado-de-luxo",
            storageBucket: "marketplace-achado-de-luxo.appspot.com",
            messagingSenderId: "499751513546",
            appId: "1:499751513546:web:2c814ecff3da171fa93333",
            measurementId: "G-R3D0Z42RG3"));
  } else {
    await Firebase.initializeApp();
  }
}
