import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/screens_routs.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD With Firestore',
      home: const MainScreen(),
      routes: {
        'main': (context) => const MainScreen(),
        'login': (context) => const LoginPage(),
        'adduser': (context) => const NewUser(),
        'home': (context) => const HomePage(),
      },
    );
  }
}
