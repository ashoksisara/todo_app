import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider.dart';
import 'provider/todo_provider.dart';
import 'utils/app_theme.dart';
import 'views/auth/sign_in_screen.dart';
import 'views/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => TODOProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getThemeData(),
      home: const Wrapper(),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        initialData: null,
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.data != null
              ?  const HomeScreen()
              :  const SignInScreen();
        },
      ),
    );
  }
}
