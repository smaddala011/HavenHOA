import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'firebase/firebase_options.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(const HavenHOAApp());
}

class HavenHOAApp extends StatelessWidget {
  const HavenHOAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HavenHOA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}
