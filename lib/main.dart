import 'package:flutter/material.dart';
import 'package:pocket_gad/screens/control_panel.dart';

import 'package:pocket_gad/screens/landing_page.dart';
import 'package:pocket_gad/screens/login_page.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlaceHolder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 234, 160, 251)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 234, 160, 251)
        )
      ),
      home: const LandingPage(), // start here
      routes: {
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}